/*
 * dllexport.h
 *
 * FIXME: 功能简要概述
 *
 * Created on: 2019年 8月 26日
 * Author: lixingcong
 */

#ifndef COLA_DLLEXPORT_H
#define COLA_DLLEXPORT_H

#if defined(_MSC_VER) && !defined(LIBCOLA_NO_DLL)
#ifdef LIBCOLA_EXPORTS
#define COLA_EXPORT __declspec(dllexport) // 用msvc2013编译器要使这行生效，即定义DEFINES+=LIBCOLA_EXPORTS
#else
#define COLA_EXPORT __declspec(dllimport)
#endif
#else
#define COLA_EXPORT
#endif

#endif // COLA_DLLEXPORT_H
