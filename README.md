# Boost 交叉编译
## 环境
### 工具
[VirtualBox](https://www.virtualbox.org/) + [ubuntu 20 live server amd64 iso](https://mirrors.zju.edu.cn/ubuntu-releases/20.04.5/ubuntu-20.04.5-live-server-amd64.iso).
### 虚机配置
#### 网络
* 设置一个host-only的网卡
* 如果不能ssh访问，设置host-only网口
```bash
$ sudo ifconfig enp0s8 up
$ sudo ifconfig enp0s8 [some ip, e.g. 192.168.0.100]
```
#### 共享文件夹
在VirtualBox设置中设置了以后，在linux上设置

```
$ sudo apt install virtualbox-guest-utils
$ sudo mount -t vboxsf [name configured in host] [directory created]
```
#### 一些工具

```
$ sudo apt-get install unzip
$ sudo apt-get install ip-utils
```
参考

* [操作](https://gist.github.com/estorgio/1d679f962e8209f8a9232f7593683265)
* [命名](https://askubuntu.com/questions/1355061/shared-folder-was-not-found-vboxsf)

## 编译
### 目录结构

|用户目录|子目录|子目录|说明|
|---|---|---||---|
|/home/user1/||||
||tools||for toolchains|
||tools|sdksrcs|sdk源代码|
||tools|toolchains|sdk源代码编译结构，应用库文件编译toolchain|
||tools|scripts|编译脚本|
||workspaces||应用库工作环境|
||workspaces|packages|下载的压缩文件|
||workspaces|libs|应用库编译结果|
||workspaces|boost_1_75_0|需要编译的源代码|

### 编译命令

Boost 参考[build_boost_testios.sh](./scripts/build_boolst_testios.sh):

``` bash
cd $BOOST_SRC_PATH; ./tools/build/b2  \         # b2为boost的编译工具
    cxxflags="-fPIC -std=c++11 -stdlib=libc++ -fvisibility=hidden -fvisibility-inlines-hidden -isysroot $IOS_SDK_PATH " \
    cflags="-fPIC" \                            # cxxflags和cflags可随意加减
    linkflags="-isysroot $IOS_SDK_PATH " \      # 同上
    define=BOOST_THREAD_TEST=1 \                # -D
    toolset=clang-testios \                     # 1.
    target-os=iphone \                          # 2.
    architecture=arm \                          # 3. 这3个配套，要和编译目标一致
    variant=release \                           # release或debug 版本
    --layout=versioned \ 
    threading=multi \ 
    threadapi=pthread \
    link=static \                               # 1.
    runtime-link=static \                       # 2. 这2个配套，表示编译.a文件
    --stagedir=$BOOST_STAGE_PATH \              # 编译结果目录
    --with-atomic \                             # 需要编译的库，如 --with-date_time
    --with-filesystem \
    -d2                                         # debug log 等级，一般d1，d2已经比较详细

```

更多配置参考：[b2](https://www.boost.org/doc/libs/1_80_0/tools/build/doc/html/index.html#_introduction)
## 编译环境创建
### 编译工具安装

``` bash
$ sudo apt-get upgrade
$ sudo apt-get install bison zip unzip python clang cmake libssl-dev lzma-dev libxml2-dev llvm-dev uuid-dev 
```
### toolchains
#### android

1. 下载[android-ndk-r21e-linux-x86_64.zip](https://dl.google.com/android/repository/android-ndk-r21e-linux-x86_64.zip)
2. [buildtoolchain_android.sh](./scripts/env_cross/buildtoolchain_android.sh)
3.  [How to compile a static library using the android ndk](https://stackoverflow.com/questions/2943828/how-to-compile-a-static-library-using-the-android-ndk)
4.  [脚本来源](https://gist.github.com/enh/b2dc8e2cbbce7fffffde2135271b10fd)

#### mac

1. 下载 __osxcross__ 代码

* https://github.com/tpoechtrager/osxcross.git
* https://github.com/tpoechtrager/xar.git
* https://github.com/tpoechtrager/apple-libtapi.git
* https://github.com/tpoechtrager/cctools-port.git

2. [从mini打包sdk源](https://github.com/tpoechtrager/osxcross#packaging-the-sdk)
3. 将打包好的Mac**.tar.gz 放到osxcross-master/tarball/目录下
4. [buildtoolchain_mac.sh](./scripts/env_cross/buildtoolchain_mac.sh)

#### ios

1. 下载代码

* https://github.com/tpoechtrager/apple-libtapi.git
* https://github.com/tpoechtrager/cctools-port.git
* https://github.com/tpoechtrager/ldid.git

2. [打包sdk源并编译](https://docs.godotengine.org/en/stable/development/compiling/cross-compiling_for_ios_on_linux.html)
3. [boosttoolchain_ios.sh](./scripts/env_cross/buildtoolchain_ios.sh)

#### ios simulator
同ios
### toolchain 配置
配置[boost project-config.jam](./scripts/env_cross/boost75/project-config.jam)
### 问题
一些sdk工具不能处理空文件，导致编译失败但不报错。目前需要调整makefile文件过滤这些文件。
### 参考
* https://github.com/tpoechtrager/osxcross
* https://crosstool-ng.github.io/docs/introduction/
* https://github.com/tpoechtrager/cctools-port/tree/master/cctools
* https://github.com/faithfracture/Apple-Boost-BuildScript/blob/master/boost.sh
* [mac上编译ios](./boostcompile.md)