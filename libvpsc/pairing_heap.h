/*
 * vim: ts=4 sw=4 et tw=0 wm=0
 *
 * libvpsc - A solver for the problem of Variable Placement with 
 *           Separation Constraints.
 *
 * Copyright (C) 2005  Mark Allen Weiss
 * Copyright (C) 2005-2008  Monash University
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library in the file LICENSE; if not, 
 * write to the Free Software Foundation, Inc., 59 Temple Place, 
 * Suite 330, Boston, MA  02111-1307  USA
 *
*/

/**
 * \brief Pairing heap datastructure implementation
 *
 * Based on example code in "Data structures and Algorithm Analysis in C++"
 * by Mark Allen Weiss, used and released under the LGPL by permission
 * of the author.
 *
 * No promises about correctness.  Use at your own risk!
 *
 * Authors:
 *   Mark Allen Weiss
 *   Tim Dwyer <tgdwyer@gmail.com>
 *
 */
#ifndef PAIRING_HEAP_H_
#define PAIRING_HEAP_H_

#include <cstdlib>
#include <fstream>
#include <vector>
#include <list>

#include "libvpsc/assertions.h"

class Underflow { };

// Pairing heap class
//
// CONSTRUCTION: with no parameters
//
// ******************PUBLIC OPERATIONS*********************
// PairNode & insert( x ) --> Insert x
// deleteMin( minItem )   --> Remove (and optionally return) smallest item
// T findMin( )  --> Return smallest item
// bool isEmpty( )        --> Return true if empty; else false
// void makeEmpty( )      --> Remove all items
// void decreaseKey( PairNode p, newVal )
//                        --> Decrease value in node p
// ******************ERRORS********************************
// Throws Underflow as warranted


template <class T>
struct PairNode
{
	T   element;
	PairNode    *leftChild;
	PairNode    *nextSibling;
	PairNode    *prev;

	PairNode( const T & theElement ) :
	       	element( theElement ),
		leftChild(NULL), nextSibling(NULL), prev(NULL)
       	{ }
};

template <class T, class TCompare>
class PairingHeap;

template <class T,class TCompare>
std::ostream& operator <<(std::ostream &os, const PairingHeap<T,TCompare> &b);

template <class T, class TCompare = std::less<T> >
class PairingHeap
{
#ifndef SWIG
	friend std::ostream& operator<< <T,TCompare> (std::ostream &os, const PairingHeap<T,TCompare> &b);
#endif
public:
	PairingHeap() : root(NULL), counter(0) { }
	PairingHeap(const PairingHeap & rhs) { 
		// uses operator= to make deep copy
		*this = rhs; 
	}
	~PairingHeap() { makeEmpty(); }
	const PairingHeap & operator=( const PairingHeap & rhs );
	bool isEmpty() const { return root == NULL; }
	unsigned size() const { return counter; }
	PairNode<T> *insert( const T & x );
	const T & findMin( ) const;
	void deleteMin( );
	const T extractMin( ) {
		T v = findMin();
		deleteMin();
		return v;
	}
	void makeEmpty() {
		reclaimMemory(root);
		root = NULL;
		counter = 0;
	}
	void decreaseKey( PairNode<T> *p, const T & newVal );
	void merge( PairingHeap<T,TCompare> *rhs );
protected:
	// Destructively gets the root for merging into another heap.
	PairNode<T> * removeRootForMerge(unsigned& size) {
		PairNode<T> *r=root;
		root=NULL;
		size=counter;
		counter=0;
		return r;
	}
	TCompare lessThan;
private:
	PairNode<T> *root;
	unsigned counter;
	void reclaimMemory( PairNode<T> *t ) const;
	void compareAndLink( PairNode<T> * & first, PairNode<T> *second ) const;
	PairNode<T> * combineSiblings( PairNode<T> *firstSibling ) const;
	PairNode<T> * clone( PairNode<T> * t ) const;
};


/**
* Insert item x into the priority queue, maintaining heap order.
* Return a pointer to the node containing the new item.
*/
template <class T,class TCompare>
PairNode<T> *
PairingHeap<T,TCompare>::insert( const T & x )
{
	PairNode<T> *newNode = new PairNode<T>( x );

	if( root == NULL )
		root = newNode;
	else
		compareAndLink( root, newNode );
	counter++;
	return newNode;
}

/**
* Find the smallest item in the priority queue.
* Return the smallest item, or throw Underflow if empty.
*/
template <class T,class TCompare>
const T & PairingHeap<T,TCompare>::findMin( ) const
{
	if( isEmpty( ) )
		throw Underflow( );
	return root->element;
}
/**
 * Remove the smallest item from the priority queue.
 * Throws Underflow if empty.
 */
template <class T,class TCompare>
void PairingHeap<T,TCompare>::deleteMin( )
{
    if( isEmpty( ) )
        throw Underflow( );

    PairNode<T> *oldRoot = root;

    if( root->leftChild == NULL )
        root = NULL;
    else
        root = combineSiblings( root->leftChild );
    COLA_ASSERT(counter);
    counter--;
    delete oldRoot;
}

/**
* Deep copy.
*/
template <class T,class TCompare>
const PairingHeap<T,TCompare> &
PairingHeap<T,TCompare>::operator=( const PairingHeap<T,TCompare> & rhs )
{
	if( this != &rhs )
	{
		makeEmpty( );
		root = clone( rhs.root );
		counter = rhs.size();
	}

	return *this;
}

/**
* Internal method to make the tree empty.
* WARNING: This is prone to running out of stack space.
*/
template <class T,class TCompare>
void PairingHeap<T,TCompare>::reclaimMemory( PairNode<T> * t ) const
{
	if( t != NULL )
	{
		reclaimMemory( t->leftChild );
		reclaimMemory( t->nextSibling );
		delete t;
	}
}

/**
* Change the value of the item stored in the pairing heap.
* Does nothing if newVal is larger than currently stored value.
* p points to a node returned by insert.
* newVal is the new value, which must be smaller
*    than the currently stored value.
*/
template <class T,class TCompare>
void PairingHeap<T,TCompare>::decreaseKey( PairNode<T> *p,
				  const T & newVal )
{
	COLA_ASSERT(!lessThan(p->element,newVal)); // newVal cannot be bigger
	p->element = newVal;
	if( p != root )
	{
		if( p->nextSibling != NULL )
			p->nextSibling->prev = p->prev;
		if( p->prev->leftChild == p )
			p->prev->leftChild = p->nextSibling;
		else
			p->prev->nextSibling = p->nextSibling;

		p->nextSibling = NULL;
		compareAndLink( root, p );
	}
}

/**
 * Merges rhs into this pairing heap by inserting its root
 */
template <class T,class TCompare>
void PairingHeap<T,TCompare>::merge( PairingHeap<T,TCompare> *rhs )
{	
	unsigned rhsSize;
	PairNode<T> *broot=rhs->removeRootForMerge(rhsSize);
	if (root == NULL) {
		root = broot; 
	} else {
		compareAndLink(root, broot);
	}
	counter+=rhsSize;
}

/**
* Internal method that is the basic operation to maintain order.
* Links first and second together to satisfy heap order.
* first is root of tree 1, which may not be NULL.
*    first->nextSibling MUST be NULL on entry.
* second is root of tree 2, which may be NULL.
* first becomes the result of the tree merge.
*/
template <class T,class TCompare>
void PairingHeap<T,TCompare>::
compareAndLink( PairNode<T> * & first,
		PairNode<T> *second ) const
{
	if( second == NULL )
		return;

	if( lessThan(second->element,first->element) )
	{
		// Attach first as leftmost child of second
		second->prev = first->prev;
		first->prev = second;
		first->nextSibling = second->leftChild;
		if( first->nextSibling != NULL )
			first->nextSibling->prev = first;
		second->leftChild = first;
		first = second;
	}
	else
	{
		// Attach second as leftmost child of first
		second->prev = first;
		first->nextSibling = second->nextSibling;
		if( first->nextSibling != NULL )
			first->nextSibling->prev = first;
		second->nextSibling = first->leftChild;
		if( second->nextSibling != NULL )
			second->nextSibling->prev = second;
		first->leftChild = second;
	}
}

/**
* Internal method that implements two-pass merging.
* firstSibling the root of the conglomerate;
*     assumed not NULL.
*/
template <class T,class TCompare>
PairNode<T> *
PairingHeap<T,TCompare>::combineSiblings( PairNode<T> *firstSibling ) const
{
	if( firstSibling->nextSibling == NULL )
		return firstSibling;

	// Allocate the array
	static std::vector<PairNode<T> *> treeArray( 5 );

	// Store the subtrees in an array
	int numSiblings = 0;
	for( ; firstSibling != NULL; numSiblings++ )
	{
		if( numSiblings == (int)treeArray.size( ) )
			treeArray.resize( numSiblings * 2 );
		treeArray[ numSiblings ] = firstSibling;
		firstSibling->prev->nextSibling = NULL;  // break links
		firstSibling = firstSibling->nextSibling;
	}
	if( numSiblings == (int)treeArray.size( ) )
		treeArray.resize( numSiblings + 1 );
	treeArray[ numSiblings ] = NULL;

	// Combine subtrees two at a time, going left to right
	int i = 0;
	for( ; i + 1 < numSiblings; i += 2 )
		compareAndLink( treeArray[ i ], treeArray[ i + 1 ] );

	int j = i - 2;

	// j has the result of last compareAndLink.
	// If an odd number of trees, get the last one.
	if( j == numSiblings - 3 )
		compareAndLink( treeArray[ j ], treeArray[ j + 2 ] );

	// Now go right to left, merging last tree with
	// next to last. The result becomes the new last.
	for( ; j >= 2; j -= 2 )
		compareAndLink( treeArray[ j - 2 ], treeArray[ j ] );
	return treeArray[ 0 ];
}

/**
* Internal method to clone subtree.
* WARNING: This is prone to running out of stack space.
*/
template <class T,class TCompare>
PairNode<T> *
PairingHeap<T,TCompare>::clone( PairNode<T> * t ) const
{
	if( t == NULL ) 
		return NULL;
	else
	{
		PairNode<T> *p = new PairNode<T>( t->element );
		if( ( p->leftChild = clone( t->leftChild ) ) != NULL )
			p->leftChild->prev = p;
		if( ( p->nextSibling = clone( t->nextSibling ) ) != NULL )
			p->nextSibling->prev = p;
		return p;
	}
}

template <class T,class TCompare>
std::ostream& operator <<(std::ostream &os, const PairingHeap<T,TCompare> &b)
{
	os<<"Heap:";
	if (b.root != NULL) {
		PairNode<T> *r = b.root;
		std::list<PairNode<T>*> q;
		q.push_back(r);
		while (!q.empty()) {
			r = q.front();
			q.pop_front();
			if (r->leftChild != NULL) {
				os << *r->element << ">";
				PairNode<T> *c = r->leftChild;
				while (c != NULL) {
					q.push_back(c);
					os << "," << *c->element;
					c = c->nextSibling;
				}
				os << "|";
			}
		}
	}
	return os;
}

#endif /* !PAIRING_HEAP_H_ */
