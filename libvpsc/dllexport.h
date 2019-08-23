/*
 * dllexport.h
 *
 * FIXME: 功能简要概述
 *
 * Created on: 2019年 8月 26日
 * Author: lixingcong
 */

#ifndef VPSC_DLLEXPORT_H
#define VPSC_DLLEXPORT_H

#if defined(_MSC_VER) && !defined(LIBVPSC_NO_DLL)
    #ifdef LIBVPSC_EXPORTS
        #define VPSC_EXPORT __declspec(dllexport) // 用msvc2013编译器要使这行生效，即定义DEFINES+=LIBVPSC_EXPORTS
    #else
        #define VPSC_EXPORT __declspec(dllimport)
    #endif
#else
    #define VPSC_EXPORT
#endif

#endif
