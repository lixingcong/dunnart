/*
 * dllexport.h
 *
 * FIXME: 功能简要概述
 *
 * Created on: 2019年 8月 26日
 * Author: lixingcong
 */

#ifndef TOPOLOGYDLLEXPORT_H
#define TOPOLOGYDLLEXPORT_H

#if defined(_MSC_VER) && !defined(LIBTOPOLOGY_NO_DLL)
#ifdef LIBTOPOLOGY_EXPORTS
#define TOPOLOGY_EXPORT __declspec(dllexport) // 用msvc2013编译器要使这行生效，即定义DEFINES+=LIBTOPOLOGY_EXPORTS
#else
#define TOPOLOGY_EXPORT __declspec(dllimport)
#endif
#else
#define TOPOLOGY_EXPORT
#endif

#endif // TOPOLOGYDLLEXPORT_H
