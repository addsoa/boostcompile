# Boost �������
## ����
### ����
[VirtualBox](https://www.virtualbox.org/) + [ubuntu 22 live server amd64 iso](https://mirror.nju.edu.cn/ubuntu-releases/22.04.1/ubuntu-22.04.1-live-server-amd64.iso).

��Ϊubuntu20��clang�汾�Ƚ��ϣ���opencv��������������ubuntu server 22�ȽϺá�
## ����
### Ŀ¼�ṹ

|�û�Ŀ¼|��Ŀ¼|��Ŀ¼|˵��|
|---|---|---|---|
|/home/user1/||||
||tools||for toolchains|
||tools|sdksrcs|sdkԴ����|
||tools|toolchains|sdkԴ�������ṹ��Ӧ�ÿ��ļ�����toolchain|
||tools|scripts|����toolchain�Ľű�|
||workspaces||Ӧ�ÿ⹤������|
||workspaces|packages|���ص�ѹ���ļ�|
||workspaces|libs|Ӧ�ÿ���뼯�з���(optional)|
||workspaces|boost_1_75_0|��Ҫ�����Դ����|
||workspaces|tools||

### ��������
#### boost
``` bash
$ cd ~/workspaces/boost_1_75_0/build; rm -rf *
$ cd ~/workspaces/boost_1_75_0/buildscripts
$ ./build_boost_testios.sh release/debug    #release �� debug
```

��������ο�[build_boost_testios.sh](./workspaces/boost_1_75_0/buildscripts/build_boost_testios.sh):

``` bash
cd $BOOST_SRC_PATH; ./tools/build/b2  \         # b2Ϊboost�ı��빤��
    cxxflags="-fPIC -std=c++11 -stdlib=libc++ -fvisibility=hidden -fvisibility-inlines-hidden -isysroot $IOS_SDK_PATH " \
    cflags="-fPIC" \                            # cxxflags��cflags������Ӽ�
    linkflags="-isysroot $IOS_SDK_PATH " \      # ͬ��
    define=BOOST_THREAD_TEST=1 \                # -D
    toolset=clang-testios \                     # 1.
    target-os=iphone \                          # 2.
    architecture=arm \                          # 3. ��3�����ף�Ҫ�ͱ���Ŀ��һ��
    variant=$VARIANT \                          # release��debug �汾
    --layout=versioned \ 
    threading=multi \ 
    threadapi=pthread \
    link=static \                               # 1.
    runtime-link=static \                       # 2. ��2�����ף���ʾ����.a�ļ�
    --stagedir=$BOOST_STAGE_PATH \              # ������Ŀ¼
    --with-atomic \                             # ��Ҫ����Ŀ⣬�� --with-date_time
    --with-filesystem \
    -d2                                         # debug log �ȼ���һ��d1��d2�Ѿ��Ƚ���ϸ

```

�������òο���[b2](https://www.boost.org/doc/libs/1_80_0/tools/build/doc/html/index.html#_introduction)
#### ��cmake����Ŀ�
������Щ���ñ�׼cmake���룺
* clipper
* libiconv
* lzma
* opencv
* sqlite

������Щ������

``` bash
$ cd build; rm -rf *
$ cmake -DBUILD_MAC_LIB=1 -DCMAKE_BUILD_TYPE=Debug ../
$ make
```
CMAKE_BUILD_TYPE��ѡ��Debug, Release

BUILD_XXX_LIB �Ŀ�ѡ������[toolchain_config.sh](./env_cross/workspaces/buildconfigus/toolchain_config.cmake)����ѡ��

``` bash
#set(BUILD_MAC_LIB 1)
#set(BUILD_ANDROID_LIB 1)
#set(BUILD_IOSSIM_LIB 1)
#set(BUILD_IOS_LIB 1)
```
## ���뻷������
### ���빤�߰�װ

``` bash
$ sudo apt-get upgrade
$ sudo apt-get install bison zip unzip python clang cmake libssl-dev lzma-dev libxml2-dev llvm-dev uuid-dev nasm libtool python-is-python3
```
### toolchains
#### android

1. ����[android-ndk-r21e-linux-x86_64.zip](https://dl.google.com/android/repository/android-ndk-r21e-linux-x86_64.zip)
2. [buildtoolchain_android.sh](./env_cross/tools/scripts/buildtoolchain_android.sh)
3.  [How to compile a static library using the android ndk](https://stackoverflow.com/questions/2943828/how-to-compile-a-static-library-using-the-android-ndk)
4.  [�ű���Դ](https://gist.github.com/enh/b2dc8e2cbbce7fffffde2135271b10fd)

#### mac

1. ���� __osxcross__ ����

* https://github.com/tpoechtrager/osxcross.git
* https://github.com/tpoechtrager/xar.git
* https://github.com/tpoechtrager/apple-libtapi.git
* https://github.com/tpoechtrager/cctools-port.git

2. [��mini���sdkԴ](https://github.com/tpoechtrager/osxcross#packaging-the-sdk)
3. ������õ�Mac**.tar.gz �ŵ�osxcross-master/tarball/Ŀ¼��
4. [buildtoolchain_mac.sh](./env_cross/tools/scripts/buildtoolchain_mac.sh)

#### ios

1. ���ش���

* https://github.com/tpoechtrager/apple-libtapi.git
* https://github.com/tpoechtrager/cctools-port.git
* https://github.com/tpoechtrager/ldid.git

2. [���sdkԴ������](https://docs.godotengine.org/en/stable/development/compiling/cross-compiling_for_ios_on_linux.html)
3. [boosttoolchain_ios.sh](./env_cross/tools/scripts/buildtoolchain_ios.sh)

#### ios simulator
ͬios
### toolchain ����
����[boost project-config.jam](./env_cross/tools/scripts/boost75/project-config.jam)
### ����
һЩsdk���߲��ܴ�����ļ������±���ʧ�ܵ�������Ŀǰ��Ҫ����makefile�ļ�������Щ�ļ���
### �ο�
* https://github.com/tpoechtrager/osxcross
* https://crosstool-ng.github.io/docs/introduction/
* https://github.com/tpoechtrager/cctools-port/tree/master/cctools
* https://github.com/faithfracture/Apple-Boost-BuildScript/blob/master/boost.sh
* [mac�ϱ���ios](./boostcompile.md)