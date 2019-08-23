/*
 * dllexport.h
 *
 * FIXME: 功能简要概述
 *
 * Created on: 2019年 8月 26日
 * Author: lixingcong
 */

#ifndef DUNNARTCANVASDLLEXPORT_H
#define DUNNARTCANVASDLLEXPORT_H

#if defined(_MSC_VER) && !defined(LIBDUNNARTCANVAS_NO_DLL)
#ifdef LIBDUNNARTCANVAS_EXPORTS
#define DUNNARTCANVAS_EXPORT __declspec(dllexport) // 用msvc2013编译器要使这行生效，即定义DEFINES+=LIBDUNNARTCANVAS_EXPORTS
#else
#define DUNNARTCANVAS_EXPORT __declspec(dllimport)
#endif
#else
#define DUNNARTCANVAS_EXPORT
#endif

#endif // DUNNARTCANVASDLLEXPORT_H
