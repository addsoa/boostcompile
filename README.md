# boost的编译
* 编译[boost_1_75](https://boostorg.jfrog.io/artifactory/main/release/1.75.0/source/boost_1_75_0.tar.bz2)
* 目前只处理了静态库的情况。
* [测试代码](./testbuild/)
## Android
### 工具
[VirtualBox](https://www.virtualbox.org/) + [ubuntu 20 live server amd64 iso](https://mirrors.zju.edu.cn/ubuntu-releases/20.04.5/ubuntu-20.04.5-live-server-amd64.iso).

在Vmware上试过各种ubuntu-desktop，都不行。没有试过Virtualbox + ubuntu server的组合。总之带图形界面的desktop风险比较大。

#### 一些设置
* 设置一个host-only的网卡

![interface](./images/network1.png)

* 共享文件夹
在VirtualBox设置中设置了以后，在linux上设置

```
$ sudo apt install virtualbox-guest-utils
$ sudo mount -t vboxsf [name configured in host] [directory created]
```
* 一些工具

```
$ sudo apt-get install unzip
$ sudo apt-get install ip-utils
```
参考

* [操作](https://gist.github.com/estorgio/1d679f962e8209f8a9232f7593683265)
* [命名](https://askubuntu.com/questions/1355061/shared-folder-was-not-found-vboxsf)

### 编译
* 安装linux 编译工具

```
$ sudo apt-get install build-essential linux-headers-`uname -r`
```

* 安装android 编译工具, 直接解压缩。

```
$ wget https://dl.google.com/android/repository/android-ndk-r21e-linux-x86_64.zip
```


* 我的编译环境目录结构是这样

![files](./images/files.png)


* 编译脚本来自 [gist](https://gist.github.com/enh/b2dc8e2cbbce7fffffde2135271b10fd), 修改并使用的脚本: [test_aarch.sh](./scripts/test_aarch.sh)。

* 编译结果在 **boost_1_75_0/stage/lib/**

### 测试
* 安装 [android studio](https://developer.android.com/studio).

* [创建一个c++项目](https://developer.android.com/studio/projects/add-native-code)

* [创建一个虚拟设备](https://developer.android.com/studio/run/managing-avds#skins), 选这个设备类型，太高版本的x86模拟不了arm，太低版本的不是**v8a**
![device](./images/device1.png)

## MacOS
### 交叉编译
在ubuntu虚机上
* 用clang-darwin编在出库在mac上不能识别
* 用darwin-clang编没有darwin环境。darwin默认macOS，网上找了一下，在linux上搭建这个环境好像不是主流，没看到参考。
* 打算先搞ios再来看这个
### 在Mac mini上
这台机器已经装好了Xcode，直接就可以编译[test_mac](./scripts/test_mac.sh), 实际上使用的toolset=clang-darwin131

## 参考
[clang: libc++](https://stackoverflow.com/questions/8486077/how-to-compile-link-boost-with-clang-libc)
[clang安装](https://stackoverflow.com/questions/39332406/install-libc-on-ubuntu)
[mac: visibility](https://stackoverflow.com/questions/8685045/xcode-with-boost-linkerid-warning-about-visibility-settings)
[lipo](https://blog.csdn.net/qq_33053671/article/details/106388313)
[compilers](https://www.alibabacloud.com/blog/gcc-vs--clangllvm-an-in-depth-comparison-of-cc%2B%2B-compilers_595309)
[clang](https://clang.llvm.org/get_started.html)
[llvm](https://llvm.org/docs/GettingStarted.html#requirements)



