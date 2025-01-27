
TEMPLATE = lib
TARGET = ogdf

CONFIG += shared warn_off

INCLUDEPATH += .
DEPENDPATH += .

include(../common_options.qmake)
CONFIG -= qt

!win32{
    QMAKE_CXXFLAGS_DEBUG += -Wall -W -Wno-unused-parameter
    QMAKE_CXXFLAGS_RELEASE += -Wall -W -Wno-unused-parameter
}

win32 {
    LIBS += -lpsapi

    win32-g++:{
	QMAKE_CXXFLAGS_DEBUG += -Wall -W -Wno-unused-parameter
	QMAKE_CXXFLAGS_RELEASE += -Wall -W -Wno-unused-parameter
	LIBS += -Wl,--export-all-symbols -Wl,--no-whole-archive
    }

    !win32-g++:{DEFINES+=OGDF_DLL OGDF_INSTALL}
}

# Input

SOURCES += src/augmentation/DfsMakeBiconnected.cpp \
        src/augmentation/PlanarAugmentation.cpp \
        src/augmentation/PlanarAugmentationFix.cpp \
        src/basic/basic.cpp \
        src/basic/BuildInfo.cpp \
        src/basic/CliqueFinder.cpp \
        src/basic/CombinatorialEmbedding.cpp \
        src/basic/DualGraph.cpp \
        src/basic/EdgeComparer.cpp \
        src/basic/EdgeComparerSimple.cpp \
        src/basic/extended_graph_alg.cpp \
        src/basic/geometry.cpp \
        src/basic/Graph.cpp \
        src/basic/graph_generators.cpp \
        src/basic/GraphAttributes.cpp \
        src/basic/GraphCopy.cpp \
        src/basic/GridLayout.cpp \
        src/basic/GridLayoutModule.cpp \
        src/basic/Hashing.cpp \
        src/basic/Licenser.cpp \
        src/basic/Logger.cpp \
        src/basic/modules.cpp \
        src/basic/NearestRectangleFinder.cpp \
        src/basic/PoolMemoryAllocator.cpp \
        src/basic/PreprocessorLayout.cpp \
        src/basic/random_hierarchy.cpp \
        src/basic/simple_graph_alg.cpp \
        src/basic/stNumber.cpp \
        src/basic/String.cpp \
        src/basic/System.cpp \
        src/basic/UMLGraph.cpp \
        src/cluster/CconnectClusterPlanar.cpp \
        src/cluster/CconnectClusterPlanarEmbed.cpp \
        src/cluster/Clusterer.cpp \
        src/cluster/ClusterGraph.cpp \
        src/cluster/ClusterGraphAttributes.cpp \
        src/cluster/ClusterPlanarizationLayout.cpp \
        src/cluster/CPlanarEdgeInserter.cpp \
        src/cluster/CPlanarSubClusteredGraph.cpp \
        src/cluster/CPlanarSubCLusteredST.cpp \
        src/cluster/MaxCPlanar_ChunkConnection.cpp \
        src/cluster/MaxCPlanar_CutConstraint.cpp \
        src/cluster/MaxCPlanar_Edge.cpp \
        src/cluster/MaxCPlanar_KuratowskiConstraint.cpp \
        src/cluster/MaxCPlanar_Master.cpp \
        src/cluster/MaxCPlanar_MaxPlanarEdges.cpp \
        src/cluster/MaxCPlanar_MinimalClusterConnection.cpp \
        src/cluster/MaxCPlanar_Sub.cpp \
        src/cluster/MaximumCPlanarSubgraph.cpp \
        src/decomposition/BCTree.cpp \
        src/decomposition/DynamicBCTree.cpp \
        src/decomposition/DynamicSPQRForest.cpp \
        src/decomposition/DynamicSPQRTree.cpp \
        src/decomposition/NonPlanarCore.cpp \
        src/decomposition/PlanarSPQRTree.cpp \
        src/decomposition/StaticSPQRTree.cpp \
        src/decomposition/TricComp.cpp \
        src/energybased/AdjacencyOracle.cpp \
        src/energybased/ArrayGraph.cpp \
        src/energybased/Attraction.cpp \
        src/energybased/CoinTutteLayout.cpp \
        src/energybased/DavidsonHarel.cpp \
        src/energybased/DavidsonHarelLayout.cpp \
        src/energybased/EdgeAttributes.cpp \
        src/energybased/EnergyFunction.cpp \
        src/energybased/FastMultipoleEmbedder.cpp \
        src/energybased/FastUtils.cpp \
        src/energybased/FMEKernel.cpp \
        src/energybased/FMEMultipoleKernel.cpp \
        src/energybased/FMEThread.cpp \
        src/energybased/FMMMLayout.cpp \
        src/energybased/FruchtermanReingold.cpp \
        src/energybased/GalaxyMultilevel.cpp \
        src/energybased/GEMLayout.cpp \
        src/energybased/IntersectionRectangle.cpp \
        src/energybased/LinearQuadtree.cpp \
        src/energybased/LinearQuadtreeBuilder.cpp \
        src/energybased/LinearQuadtreeExpansion.cpp \
        src/energybased/MAARPacking.cpp \
        src/energybased/Multilevel.cpp \
        src/energybased/MultilevelGraph.cpp \
        src/energybased/multilevelmixer/BarycenterPlacer.cpp \
        src/energybased/multilevelmixer/CirclePlacer.cpp \
        src/energybased/multilevelmixer/EdgeCoverMerger.cpp \
        src/energybased/multilevelmixer/IndependentSetMerger.cpp \
        src/energybased/multilevelmixer/LocalBiconnectedMerger.cpp \
        src/energybased/multilevelmixer/MatchingMerger.cpp \
        src/energybased/multilevelmixer/MedianPlacer.cpp \
        src/energybased/multilevelmixer/MixedForceLayout.cpp \
        src/energybased/multilevelmixer/MMMExampleFastLayout.cpp \
        src/energybased/multilevelmixer/MMMExampleNiceLayout.cpp \
        src/energybased/multilevelmixer/MMMExampleNoTwistLayout.cpp \
        src/energybased/multilevelmixer/ModularMultilevelMixerLayout.cpp \
        src/energybased/multilevelmixer/RandomMerger.cpp \
        src/energybased/multilevelmixer/RandomPlacer.cpp \
        src/energybased/multilevelmixer/ScalingLayout.cpp \
        src/energybased/multilevelmixer/SolarMerger.cpp \
        src/energybased/multilevelmixer/SolarPlacer.cpp \
        src/energybased/multilevelmixer/ZeroPlacer.cpp \
        src/energybased/NMM.cpp \
        src/energybased/NodeAttributes.cpp \
        src/energybased/NodePairEnergy.cpp \
        src/energybased/numexcept.cpp \
        src/energybased/Overlap.cpp \
        src/energybased/Planarity.cpp \
        src/energybased/PlanarityGrid.cpp \
        src/energybased/QuadTreeNM.cpp \
        src/energybased/QuadTreeNodeNM.cpp \
        src/energybased/Repulsion.cpp \
        src/energybased/Set.cpp \
        src/energybased/SpringEmbedderFR.cpp \
        src/energybased/SpringEmbedderFRExact.cpp \
        src/energybased/SpringEmbedderKK.cpp \
        src/energybased/StressMajorizationSimple.cpp \
        src/energybased/UniformGrid.cpp \
        src/energybased/WSPD.cpp \
        src/external/coin.cpp \
        src/fileformats/DinoLineBuffer.cpp \
        src/fileformats/DinoTools.cpp \
        src/fileformats/DinoUmlDiagramGraph.cpp \
        src/fileformats/DinoUmlModelGraph.cpp \
        src/fileformats/DinoUmlToGraphConverter.cpp \
        src/fileformats/DinoXmlParser.cpp \
        src/fileformats/DinoXmlScanner.cpp \
        src/fileformats/GmlParser.cpp \
        src/fileformats/OgmlParser.cpp \
        src/fileformats/simple_graph_load.cpp \
        src/fileformats/XmlParser.cpp \
        src/graphalg/ConvexHull.cpp \
        src/graphalg/mcf_front_reinelt.cpp \
        src/graphalg/MinCostFlowModule.cpp \
        src/graphalg/MinCostFlowReinelt.cpp \
        src/graphalg/MinimumCut.cpp \
        src/graphalg/ShortestPathsWithBFM.cpp \
        src/incremental/SimpleIncNodeInserter.cpp \
        src/labeling/ELabelPosSimple.cpp \
        src/layered/acyclic_subgraph.cpp \
        src/layered/CrossingsMatrix.cpp \
        src/layered/FastHierarchyLayout.cpp \
        src/layered/heuristics.cpp \
        src/layered/HierarchyLayoutModule.cpp \
        src/layered/OptimalHierarchyClusterLayout.cpp \
        src/layered/OptimalHierarchyLayout.cpp \
        src/layered/OptimalRanking.cpp \
        src/layered/ranking.cpp \
        src/layered/SplitHeuristic.cpp \
        src/layered/sugiyama-cluster.cpp \
        src/layered/sugiyama.cpp \
        src/legacy/AbacusOptimalCrossingMinimizer.cpp \
        src/legacy/AbacusOptimalCrossingMinimizerSuperPrice.cpp \
        src/legacy/CoinOptimalCrossingMinimizer.cpp \
        src/legacy/OptimalCrossingMinimizerBase.cpp \
        src/lpsolver/alps_bsolveeqs.cpp \
        src/lpsolver/alps_debug.cpp \
        src/lpsolver/alps_fsolveeqs.cpp \
        src/lpsolver/alps_getbasis.cpp \
        src/lpsolver/alps_getitercounts.cpp \
        src/lpsolver/alps_getsolution.cpp \
        src/lpsolver/alps_heap.cpp \
        src/lpsolver/alps_initproblem.cpp \
        src/lpsolver/alps_installextbasis.cpp \
        src/lpsolver/alps_loadbasis.cpp \
        src/lpsolver/alps_loadproblem.cpp \
        src/lpsolver/alps_lpread.cpp \
        src/lpsolver/alps_lufac.cpp \
        src/lpsolver/alps_optimize.cpp \
        src/lpsolver/alps_phase1prim.cpp \
        src/lpsolver/alps_pisel.cpp \
        src/lpsolver/alps_preproc.cpp \
        src/lpsolver/alps_readbasis.cpp \
        src/lpsolver/alps_recoheap.cpp \
        src/lpsolver/alps_scaling.cpp \
        src/lpsolver/alps_simplex.cpp \
        src/lpsolver/alps_sort.cpp \
        src/lpsolver/alps_transport.cpp \
        src/lpsolver/alps_unloadproblem.cpp \
        src/lpsolver/alps_writebasis.cpp \
        src/lpsolver/alps_writeproblem.cpp \
        src/lpsolver/LPSolver_coin.cpp \
        src/lpsolver/LPSolver_ogdf.cpp \
        src/lpsolver/pisel.cpp \
        src/misclayout/BalloonLayout.cpp \
        src/misclayout/CircularExactLayout.cpp \
        src/misclayout/CircularLayout.cpp \
        src/orthogonal/ClusterOrthoLayout.cpp \
        src/orthogonal/ClusterOrthoShaper.cpp \
        src/orthogonal/CompactionConstraintGraph.cpp \
        src/orthogonal/EdgeRouter.cpp \
        src/orthogonal/FlowCompaction.cpp \
        src/orthogonal/KandinskyLayout.cpp \
        src/orthogonal/LongestPathCompaction.cpp \
        src/orthogonal/NodeInfo.cpp \
        src/orthogonal/OrthoLayout.cpp \
        src/orthogonal/OrthoRep.cpp \
        src/orthogonal/OrthoShaper.cpp \
        src/packing/CCLayoutPackModule.cpp \
        src/packing/ComponentSplitterLayout.cpp \
        src/packing/TileToRowsCCPacker.cpp \
        src/planarity/BoyerMyrvold.cpp \
        src/planarity/BoyerMyrvoldInit.cpp \
        src/planarity/BoyerMyrvoldPlanar.cpp \
        src/planarity/ClusterPlanRep.cpp \
        src/planarity/EdgeInsertionModule.cpp \
        src/planarity/EmbedderMaxFace.cpp \
        src/planarity/EmbedderMaxFaceLayers.cpp \
        src/planarity/EmbedderMDMFLengthAttribute.cpp \
        src/planarity/EmbedderMinDepth.cpp \
        src/planarity/EmbedderMinDepthMaxFace.cpp \
        src/planarity/EmbedderMinDepthMaxFaceLayers.cpp \
        src/planarity/EmbedderMinDepthPiTa.cpp \
        src/planarity/EmbedPQTree.cpp \
        src/planarity/ExtractKuratowskis.cpp \
        src/planarity/FastPlanarSubgraph.cpp \
        src/planarity/FindKuratowskis.cpp \
        src/planarity/FixedEmbeddingInserter.cpp \
        src/planarity/GraphReduction.cpp \
        src/planarity/Layout.cpp \
        src/planarity/LayoutPlanRepModule.cpp \
        src/planarity/MaximalPlanarSubgraphSimple.cpp \
        src/planarity/MaximumPlanarSubgraph.cpp \
        src/planarity/MMCrossingMinimizationModule.cpp \
        src/planarity/MMFixedEmbeddingInserter.cpp \
        src/planarity/MMSubgraphPlanarizer.cpp \
        src/planarity/MMVariableEmbeddingInserter.cpp \
        src/planarity/OptimalCrossingMinimizer.cpp \
        src/planarity/OptimalSimultaneousCrossingMinimizer.cpp \
        src/planarity/OrderedOptimalCrossingMinimizer.cpp \
        src/planarity/PlanarizationGridLayout.cpp \
        src/planarity/PlanarizationLayout.cpp \
        src/planarity/PlanarizationLayout_inc.cpp \
        src/planarity/PlanarModule.cpp \
        src/planarity/PlanarPQTree.cpp \
        src/planarity/PlanarSubgraphModule.cpp \
        src/planarity/PlanarSubgraphPQTree.cpp \
        src/planarity/PlanRep.cpp \
        src/planarity/PlanRepExpansion.cpp \
        src/planarity/PlanRepInc.cpp \
        src/planarity/PlanRepUML.cpp \
        src/planarity/SimpleEmbedder.cpp \
        src/planarity/SubgraphPlanarizer.cpp \
        src/planarity/TopologyModule.cpp \
        src/planarity/VariableEmbeddingInserter.cpp \
        src/planarity/VariableEmbeddingInserter2.cpp \
        src/planarlayout/BiconnectedShellingOrder.cpp \
        src/planarlayout/IOPoints.cpp \
        src/planarlayout/MixedModelBase.cpp \
        src/planarlayout/MixedModelCrossingsBeautifierModule.cpp \
        src/planarlayout/MixedModelLayout.cpp \
        src/planarlayout/MMCBBase.cpp \
        src/planarlayout/PlanarDrawLayout.cpp \
        src/planarlayout/PlanarStraightLayout.cpp \
        src/planarlayout/ShellingOrder.cpp \
        src/planarlayout/ShellingOrderModule.cpp \
        src/planarlayout/TriconnectedShellingOrder.cpp \
        src/simultaneous/SimDraw.cpp \
        src/simultaneous/SimDrawCaller.cpp \
        src/simultaneous/SimDrawColorizer.cpp \
        src/simultaneous/SimDrawCreator.cpp \
        src/simultaneous/SimDrawCreatorSimple.cpp \
        src/simultaneous/SimDrawManipulatorModule.cpp \
        src/tree/RadialTreeLayout.cpp \
        src/tree/TreeLayout.cpp \
        src/upward/DominanceLayout.cpp \
        src/upward/ExpansionGraph.cpp \
        src/upward/FaceSinkGraph.cpp \
        src/upward/FeasibleUpwardPlanarSubgraph.cpp \
        src/upward/FixedEmbeddingUpwardEdgeInserter.cpp \
        src/upward/FUPSSimple.cpp \
        src/upward/LayerBasedUPRLayout.cpp \
        src/upward/SubgraphUpwardPlanarizer.cpp \
        src/upward/UpwardPlanarModule.cpp \
        src/upward/UpwardPlanarSubgraphModule.cpp \
        src/upward/UpwardPlanarSubgraphSimple.cpp \
        src/upward/UpwardPlanRep.cpp \
        src/upward/VisibilityLayout.cpp


HEADERS += ogdf/augmentation/DfsMakeBiconnected.h \
        ogdf/augmentation/PlanarAugmentation.h \
        ogdf/augmentation/PlanarAugmentationFix.h \
        ogdf/basic/AdjEntryArray.h \
        ogdf/basic/Array.h \
        ogdf/basic/Array2D.h \
        ogdf/basic/ArrayBuffer.h \
        ogdf/basic/Barrier.h \
        ogdf/basic/basic.h \
        ogdf/basic/BinaryHeap.h \
        ogdf/basic/BinaryHeap2.h \
        ogdf/basic/BoundedQueue.h \
        ogdf/basic/BoundedStack.h \
        ogdf/basic/CombinatorialEmbedding.h \
        ogdf/basic/comparer.h \
        ogdf/basic/CriticalSection.h \
        ogdf/basic/DualGraph.h \
        ogdf/basic/EdgeArray.h \
        ogdf/basic/EdgeComparer.h \
        ogdf/basic/EdgeComparerSimple.h \
        ogdf/basic/EFreeList.h \
        ogdf/basic/EList.h \
        ogdf/basic/exceptions.h \
        ogdf/basic/extended_graph_alg.h \
        ogdf/basic/FaceArray.h \
        ogdf/basic/FaceSet.h \
        ogdf/basic/geometry.h \
        ogdf/basic/Graph.h \
        ogdf/basic/Graph_d.h \
        ogdf/basic/graph_generators.h \
        ogdf/basic/GraphAttributes.h \
        ogdf/basic/GraphCopy.h \
        ogdf/basic/GraphCopyAttributes.h \
        ogdf/basic/GraphObserver.h \
        ogdf/basic/GridLayout.h \
        ogdf/basic/GridLayoutMapped.h \
        ogdf/basic/HashArray.h \
        ogdf/basic/HashArray2D.h \
        ogdf/basic/Hashing.h \
        ogdf/basic/HashIterator2D.h \
        ogdf/basic/HeapBase.h \
        ogdf/basic/HyperGraph.h \
        ogdf/basic/IncNodeInserter.h \
        ogdf/basic/Layout.h \
        ogdf/basic/List.h \
        ogdf/basic/Logger.h \
        ogdf/basic/math.h \
        ogdf/basic/memory.h \
        ogdf/basic/MinHeap.h \
        ogdf/basic/MinPriorityQueue.h \
        ogdf/basic/Module.h \
        ogdf/basic/ModuleOption.h \
        ogdf/basic/NearestRectangleFinder.h \
        ogdf/basic/NodeArray.h \
        ogdf/basic/NodeComparer.h \
        ogdf/basic/NodeSet.h \
        ogdf/basic/precondition.h \
        ogdf/basic/PreprocessorLayout.h \
        ogdf/basic/Queue.h \
        ogdf/basic/simple_graph_alg.h \
        ogdf/basic/Skiplist.h \
        ogdf/basic/SList.h \
        ogdf/basic/Stack.h \
        ogdf/basic/String.h \
        ogdf/basic/System.h \
        ogdf/basic/Thread.h \
        ogdf/basic/Timeouter.h \
        ogdf/basic/TopologyModule.h \
        ogdf/basic/tuples.h \
        ogdf/basic/UMLGraph.h \
        ogdf/BuildInfo.h \
        ogdf/cluster/CconnectClusterPlanar.h \
        ogdf/cluster/CconnectClusterPlanarEmbed.h \
        ogdf/cluster/ClusterArray.h \
        ogdf/cluster/ClusterGraph.h \
        ogdf/cluster/ClusterGraphAttributes.h \
        ogdf/cluster/ClusterGraphCopyAttributes.h \
        ogdf/cluster/ClusterGraphObserver.h \
        ogdf/cluster/ClusterOrthoLayout.h \
        ogdf/cluster/ClusterOrthoShaper.h \
        ogdf/cluster/ClusterPlanarizationLayout.h \
        ogdf/cluster/ClusterPlanRep.h \
        ogdf/cluster/ClusterSet.h \
        ogdf/cluster/CPlanarEdgeInserter.h \
        ogdf/cluster/CPlanarSubClusteredGraph.h \
        ogdf/cluster/MaximumCPlanarSubgraph.h \
        ogdf/decomposition/BCTree.h \
        ogdf/decomposition/DynamicBCTree.h \
        ogdf/decomposition/DynamicPlanarSPQRTree.h \
        ogdf/decomposition/DynamicSkeleton.h \
        ogdf/decomposition/DynamicSPQRForest.h \
        ogdf/decomposition/DynamicSPQRTree.h \
        ogdf/decomposition/PertinentGraph.h \
        ogdf/decomposition/PlanarSPQRTree.h \
        ogdf/decomposition/Skeleton.h \
        ogdf/decomposition/SPQRTree.h \
        ogdf/decomposition/StaticPlanarSPQRTree.h \
        ogdf/decomposition/StaticSkeleton.h \
        ogdf/decomposition/StaticSPQRTree.h \
        ogdf/energybased/CoinTutteLayout.h \
        ogdf/energybased/DavidsonHarel.h \
        ogdf/energybased/DavidsonHarelLayout.h \
        ogdf/energybased/FastMultipoleEmbedder.h \
        ogdf/energybased/FMMMLayout.h \
        ogdf/energybased/GEMLayout.h \
        ogdf/energybased/multilevelmixer/BarycenterPlacer.h \
        ogdf/energybased/multilevelmixer/CirclePlacer.h \
        ogdf/energybased/multilevelmixer/EdgeCoverMerger.h \
        ogdf/energybased/multilevelmixer/IndependentSetMerger.h \
        ogdf/energybased/multilevelmixer/InitialPlacer.h \
        ogdf/energybased/multilevelmixer/LocalBiconnectedMerger.h \
        ogdf/energybased/multilevelmixer/MatchingMerger.h \
        ogdf/energybased/multilevelmixer/MedianPlacer.h \
        ogdf/energybased/multilevelmixer/MixedForceLayout.h \
        ogdf/energybased/multilevelmixer/MMMExampleFastLayout.h \
        ogdf/energybased/multilevelmixer/MMMExampleNiceLayout.h \
        ogdf/energybased/multilevelmixer/MMMExampleNoTwistLayout.h \
        ogdf/energybased/multilevelmixer/ModularMultilevelMixerLayout.h \
        ogdf/energybased/multilevelmixer/MultilevelBuilder.h \
        ogdf/energybased/multilevelmixer/RandomMerger.h \
        ogdf/energybased/multilevelmixer/RandomPlacer.h \
        ogdf/energybased/multilevelmixer/ScalingLayout.h \
        ogdf/energybased/multilevelmixer/SolarMerger.h \
        ogdf/energybased/multilevelmixer/SolarPlacer.h \
        ogdf/energybased/multilevelmixer/ZeroPlacer.h \
        ogdf/energybased/SpringEmbedderFR.h \
        ogdf/energybased/SpringEmbedderFRExact.h \
        ogdf/energybased/SpringEmbedderKK.h \
        ogdf/energybased/StressMajorizationSimple.h \
        ogdf/external/abacus.h \
        ogdf/external/coin.h \
        ogdf/fileformats/DinoLineBuffer.h \
        ogdf/fileformats/DinoTools.h \
        ogdf/fileformats/DinoUmlDiagramGraph.h \
        ogdf/fileformats/DinoUmlModelGraph.h \
        ogdf/fileformats/DinoUmlToGraphConverter.h \
        ogdf/fileformats/DinoXmlParser.h \
        ogdf/fileformats/DinoXmlScanner.h \
        ogdf/fileformats/GmlParser.h \
        ogdf/fileformats/Ogml.h \
        ogdf/fileformats/OgmlParser.h \
        ogdf/fileformats/simple_graph_load.h \
        ogdf/fileformats/XmlObject.h \
        ogdf/fileformats/XmlParser.h \
        ogdf/graphalg/CliqueFinder.h \
        ogdf/graphalg/Clusterer.h \
        ogdf/graphalg/ConvexHull.h \
        ogdf/graphalg/GraphReduction.h \
        ogdf/graphalg/MinCostFlowReinelt.h \
        ogdf/graphalg/MinimumCut.h \
        ogdf/graphalg/ShortestPathWithBFM.h \
        ogdf/internal/basic/intrinsics.h \
        ogdf/internal/basic/list_templates.h \
        ogdf/internal/basic/MallocMemoryAllocator.h \
        ogdf/internal/basic/PoolMemoryAllocator.h \
        ogdf/internal/cluster/ClusterPQContainer.h \
        ogdf/internal/cluster/CPlanarSubClusteredST.h \
        ogdf/internal/cluster/MaxCPlanar_ChunkConnection.h \
        ogdf/internal/cluster/MaxCPlanar_CutConstraint.h \
        ogdf/internal/cluster/MaxCPlanar_Edge.h \
        ogdf/internal/cluster/MaxCPlanar_KuratowskiConstraint.h \
        ogdf/internal/cluster/MaxCPlanar_Master.h \
        ogdf/internal/cluster/MaxCPlanar_MaxPlanarEdges.h \
        ogdf/internal/cluster/MaxCPlanar_MinimalClusterConnection.h \
        ogdf/internal/cluster/MaxCPlanar_Sub.h \
        ogdf/internal/energybased/AdjacencyOracle.h \
        ogdf/internal/energybased/Attraction.h \
        ogdf/internal/energybased/EdgeAttributes.h \
        ogdf/internal/energybased/EnergyFunction.h \
        ogdf/internal/energybased/FruchtermanReingold.h \
        ogdf/internal/energybased/IntersectionRectangle.h \
        ogdf/internal/energybased/MultilevelGraph.h \
        ogdf/internal/energybased/NMM.h \
        ogdf/internal/energybased/NodeAttributes.h \
        ogdf/internal/energybased/NodePairEnergy.h \
        ogdf/internal/energybased/Overlap.h \
        ogdf/internal/energybased/ParticleInfo.h \
        ogdf/internal/energybased/Planarity.h \
        ogdf/internal/energybased/PlanarityGrid.h \
        ogdf/internal/energybased/QuadTreeNM.h \
        ogdf/internal/energybased/QuadTreeNodeNM.h \
        ogdf/internal/energybased/Repulsion.h \
        ogdf/internal/energybased/UniformGrid.h \
        ogdf/internal/lpsolver/LPSolver_coin.h \
        ogdf/internal/lpsolver/LPSolver_ogdf.h \
        ogdf/internal/orthogonal/NodeInfo.h \
        ogdf/internal/orthogonal/RoutingChannel.h \
        ogdf/internal/planarity/BoyerMyrvoldInit.h \
        ogdf/internal/planarity/BoyerMyrvoldPlanar.h \
        ogdf/internal/planarity/ConnectedSubgraph.h \
        ogdf/internal/planarity/EmbedderMaxFaceBiconnectedGraphs.h \
        ogdf/internal/planarity/EmbedderMaxFaceBiconnectedGraphsLayers.h \
        ogdf/internal/planarity/EmbedderMDMFLengthAttribute.h \
        ogdf/internal/planarity/EmbedIndicator.h \
        ogdf/internal/planarity/EmbedKey.h \
        ogdf/internal/planarity/EmbedPQTree.h \
        ogdf/internal/planarity/FindKuratowskis.h \
        ogdf/internal/planarity/MaxSequencePQTree.h \
        ogdf/internal/planarity/PlanarLeafKey.h \
        ogdf/internal/planarity/PlanarPQTree.h \
        ogdf/internal/planarity/PlanarSubgraphPQTree.h \
        ogdf/internal/planarity/PQBasicKey.h \
        ogdf/internal/planarity/PQBasicKeyRoot.h \
        ogdf/internal/planarity/PQInternalKey.h \
        ogdf/internal/planarity/PQInternalNode.h \
        ogdf/internal/planarity/PQLeaf.h \
        ogdf/internal/planarity/PQLeafKey.h \
        ogdf/internal/planarity/PQNode.h \
        ogdf/internal/planarity/PQNodeKey.h \
        ogdf/internal/planarity/PQNodeRoot.h \
        ogdf/internal/planarity/PQTree.h \
        ogdf/internal/planarity/whaInfo.h \
        ogdf/labeling/EdgeLabel.h \
        ogdf/labeling/ELabelInterface.h \
        ogdf/labeling/ELabelPosSimple.h \
        ogdf/layered/BarycenterHeuristic.h \
        ogdf/layered/CrossingsMatrix.h \
        ogdf/layered/DfsAcyclicSubgraph.h \
        ogdf/layered/ExtendedNestingGraph.h \
        ogdf/layered/FastHierarchyLayout.h \
        ogdf/layered/GreedyCycleRemoval.h \
        ogdf/layered/Hierarchy.h \
        ogdf/layered/Level.h \
        ogdf/layered/LongestPathRanking.h \
        ogdf/layered/MedianHeuristic.h \
        ogdf/layered/OptimalHierarchyClusterLayout.h \
        ogdf/layered/OptimalHierarchyLayout.h \
        ogdf/layered/OptimalRanking.h \
        ogdf/layered/SplitHeuristic.h \
        ogdf/layered/SugiyamaLayout.h \
        ogdf/legacy/AbacusOptimalCrossingMinimizer.h \
        ogdf/legacy/AbacusOptimalCrossingMinimizerSuperPrice.h \
        ogdf/legacy/CoinOptimalCrossingMinimizer.h \
        ogdf/legacy/FixedUpwardEmbeddingInserter.h \
        ogdf/legacy/OptimalCrossingMinimizerBase.h \
        ogdf/Licenser.h \
        ogdf/lpsolver/LPSolver.h \
        ogdf/misclayout/BalloonLayout.h \
        ogdf/misclayout/CircularExactLayout.h \
        ogdf/misclayout/CircularLayout.h \
        ogdf/module/AcyclicSubgraphModule.h \
        ogdf/module/AugmentationModule.h \
        ogdf/module/CCLayoutPackModule.h \
        ogdf/module/ClustererModule.h \
        ogdf/module/CPlanarSubgraphModule.h \
        ogdf/module/CrossingMinimizationModule.h \
        ogdf/module/EdgeInsertionModule.h \
        ogdf/module/EmbedderModule.h \
        ogdf/module/FUPSModule.h \
        ogdf/module/GridLayoutModule.h \
        ogdf/module/HierarchyClusterLayoutModule.h \
        ogdf/module/HierarchyLayoutModule.h \
        ogdf/module/LayoutClusterPlanRepModule.h \
        ogdf/module/LayoutModule.h \
        ogdf/module/LayoutPlanRepModule.h \
        ogdf/module/MinCostFlowModule.h \
        ogdf/module/MixedModelCrossingsBeautifierModule.h \
        ogdf/module/MMCrossingMinimizationModule.h \
        ogdf/module/MMEdgeInsertionModule.h \
        ogdf/module/PlanarSubgraphModule.h \
        ogdf/module/RankingModule.h \
        ogdf/module/ShellingOrderModule.h \
        ogdf/module/ShortestPathModule.h \
        ogdf/module/TwoLayerCrossMin.h \
        ogdf/module/UMLLayoutModule.h \
        ogdf/module/UPRLayoutModule.h \
        ogdf/module/UpwardEdgeInserterModule.h \
        ogdf/module/UpwardPlanarizerModule.h \
        ogdf/module/UpwardPlanarSubgraphModule.h \
        ogdf/orthogonal/CompactionConstraintGraph.h \
        ogdf/orthogonal/EdgeRouter.h \
        ogdf/orthogonal/FlowCompaction.h \
        ogdf/orthogonal/KandinskyLayout.h \
        ogdf/orthogonal/LongestPathCompaction.h \
        ogdf/orthogonal/MinimumEdgeDistances.h \
        ogdf/orthogonal/OrthoLayout.h \
        ogdf/orthogonal/OrthoRep.h \
        ogdf/orthogonal/OrthoShaper.h \
        ogdf/packing/ComponentSplitterLayout.h \
        ogdf/packing/TileToRowsCCPacker.h \
        ogdf/planarity/BoyerMyrvold.h \
        ogdf/planarity/EdgeTypePatterns.h \
        ogdf/planarity/EmbedderMaxFace.h \
        ogdf/planarity/EmbedderMaxFaceLayers.h \
        ogdf/planarity/EmbedderMinDepth.h \
        ogdf/planarity/EmbedderMinDepthMaxFace.h \
        ogdf/planarity/EmbedderMinDepthMaxFaceLayers.h \
        ogdf/planarity/EmbedderMinDepthPiTa.h \
        ogdf/planarity/ExtractKuratowskis.h \
        ogdf/planarity/FastPlanarSubgraph.h \
        ogdf/planarity/FixedEmbeddingInserter.h \
        ogdf/planarity/KuratowskiSubdivision.h \
        ogdf/planarity/MaximalPlanarSubgraphSimple.h \
        ogdf/planarity/MaximumPlanarSubgraph.h \
        ogdf/planarity/MMFixedEmbeddingInserter.h \
        ogdf/planarity/MMSubgraphPlanarizer.h \
        ogdf/planarity/MMVariableEmbeddingInserter.h \
        ogdf/planarity/NodeTypePatterns.h \
        ogdf/planarity/NonPlanarCore.h \
        ogdf/planarity/OptimalCrossingMinimizer.h \
        ogdf/planarity/OptimalSimultaneousCrossingMinimizer.h \
        ogdf/planarity/OrderedOptimalCrossingMinimizer.h \
        ogdf/planarity/PlanarizationGridLayout.h \
        ogdf/planarity/PlanarizationLayout.h \
        ogdf/planarity/PlanarModule.h \
        ogdf/planarity/PlanRep.h \
        ogdf/planarity/PlanRepExpansion.h \
        ogdf/planarity/PlanRepInc.h \
        ogdf/planarity/PlanRepUML.h \
        ogdf/planarity/SimpleEmbedder.h \
        ogdf/planarity/SimpleIncNodeInserter.h \
        ogdf/planarity/SubgraphPlanarizer.h \
        ogdf/planarity/VariableEmbeddingInserter.h \
        ogdf/planarity/VariableEmbeddingInserter2.h \
        ogdf/planarlayout/BiconnectedShellingOrder.h \
        ogdf/planarlayout/MixedModelLayout.h \
        ogdf/planarlayout/MMCBBase.h \
        ogdf/planarlayout/MMCBDoubleGrid.h \
        ogdf/planarlayout/MMCBLocalStretch.h \
        ogdf/planarlayout/PlanarDrawLayout.h \
        ogdf/planarlayout/PlanarStraightLayout.h \
        ogdf/planarlayout/ShellingOrder.h \
        ogdf/planarlayout/TriconnectedShellingOrder.h \
        ogdf/simultaneous/SimDraw.h \
        ogdf/simultaneous/SimDrawCaller.h \
        ogdf/simultaneous/SimDrawColorizer.h \
        ogdf/simultaneous/SimDrawCreator.h \
        ogdf/simultaneous/SimDrawCreatorSimple.h \
        ogdf/simultaneous/SimDrawManipulatorModule.h \
        ogdf/simultaneous/TwoLayerCrossMinSimDraw.h \
        ogdf/tree/RadialTreeLayout.h \
        ogdf/tree/TreeLayout.h \
        ogdf/upward/DominanceLayout.h \
        ogdf/upward/ExpansionGraph.h \
        ogdf/upward/FaceSinkGraph.h \
        ogdf/upward/FeasibleUpwardPlanarSubgraph.h \
        ogdf/upward/FixedEmbeddingUpwardEdgeInserter.h \
        ogdf/upward/FixedUpwardEmbeddingInserter.h \
        ogdf/upward/FUPSSimple.h \
        ogdf/upward/LayerBasedUPRLayout.h \
        ogdf/upward/SubgraphUpwardPlanarizer.h \
        ogdf/upward/UpwardPlanarizationLayout.h \
        ogdf/upward/UpwardPlanarModule.h \
        ogdf/upward/UpwardPlanarSubgraphSimple.h \
        ogdf/upward/UpwardPlanRep.h \
        ogdf/upward/VisibilityLayout.h
