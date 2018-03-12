1. Scikit-learn

www.github.com/scikit-learn/scikit-learn

http://scikit-learn.org/stable/supervised_learning.html#supervised-learning

Scikit-learn 是基于Scipy为机器学习建造的的一个Python模块，他的特色就是多样化的分类，回归和聚类的算法包括支持向量机，逻辑回归，朴素贝叶斯分类器，随机森林，Gradient Boosting，聚类算法和DBSCAN。
而且也设计出了Python numerical和scientific libraries Numpy and Scipy
可视化分类器的性能（比如，使用精确率与反馈率(precision-recall)图表，或者接收者操作特征(Receiver Operating Characteristics，ROC)曲线），Matplotlib可以帮助进行快速可视化。考虑到花在清理和构造数据的时间，使用这个库会非常方便，因为它可以紧密集成到其他科学计算包上。

另外，它还包含有限的自然语言处理特征提取能力，以及词袋（bag of words）、tfidf（Term Frequency Inverse Document Frequency算法）、预处理（停用词/stop-words，自定义预处理，分析器）。此外，如果你想快速对小数据集（toy dataset）进行不同基准测试的话，它自带的数据集模块提供了常见和有用的数据集。你还可以根据这些数据集创建自己的小数据集，这样在将模型应用到真实世界中之前，你可以按照自己的目的来检验模型是否符合期望。对参数最优化和参数调整，它也提供了网格搜索和随机搜索。

scikit-learn机器学习工具包学习笔记：feature_selection模块

随机森林
首先把标签和特征分离 
from sklearn.cross_validation import train_test_split 
feature_train, feature_test, target_train, target_test = 
train_test_split(feature, target, test_size=0.1, random_state=42)

主要的方法有 
model = RandomForestClassifier(n_estimators=1000) 
model.fit（feature_train , target_train） # 创建一个随机森林 
predict=predict（Z） # 对新的样本Z做预测 
score = model.score(feature_test , target_test) # 评估正确率

单机特征工程
https://www.thinksaas.cn/group/topic/501059/


2.Pylearn2

www.github.com/lisa-lab/pylearn2

Pylearn是一个让机器学习研究简单化的基于Theano的库程序。

3.NuPIC

www.github.com/numenta/nupic

NuPIC是一个以HTM学习算法为工具的机器智能平台。HTM是皮层的精确计算方法。HTM的核心是基于时间的持续学习算法和储存和撤销的时空模式。NuPIC适合于各种各样的问题,尤其是检测异常和预测的流数据来源。

4. Nilearn

www.github.com/nilearn/nilearn

Nilearn 是一个能够快速统计学习神经影像数据的Python模块。它利用Python语言中的scikit-learn 工具箱和一些进行预测建模，分类，解码，连通性分析的应用程序来进行多元的统计。

5.PyBrain

www.github.com/pybrain/pybrain

Pybrain是基于Python语言强化学习，人工智能，神经网络库的简称。 它的目标是提供灵活、容易使用并且强大的机器学习算法和进行各种各样的预定义的环境中测试来比较你的算法。

6.Pattern

www.github.com/clips/pattern

Pattern 是Python语言下的一个网络挖掘模块。它为数据挖掘，自然语言处理，网络分析和机器学习提供工具。它支持向量空间模型、聚类、支持向量机和感知机并且用KNN分类法进行分类。

7.Fuel

www.github.com/mila-udem/fuel

Fuel为你的机器学习模型提供数据。他有一个共享如MNIST, CIFAR-10 (图片数据集), Google’s One Billion Words (文字)这类数据集的接口。你使用他来通过很多种的方式来替代自己的数据。

8.Bob

www.github.com/idiap/bob

Bob是一个免费的信号处理和机器学习的工具。它的工具箱是用Python和C++语言共同编写的，它的设计目的是变得更加高效并且减少开发时间，它是由处理图像工具,音频和视频处理、机器学习和模式识别的大量软件包构成的。

9.Skdata

www.github.com/jaberg/skdata

Skdata是机器学习和统计的数据集的库程序。这个模块对于玩具问题，流行的计算机视觉和自然语言的数据集提供标准的Python语言的使用。

10.MILK

www.github.com/luispedro/milk

MILK是Python语言下的机器学习工具包。它主要是在很多可得到的分类比如SVMS,K-NN,随机森林，决策树中使用监督分类法。 它还执行特征选择。 这些分类器在许多方面相结合,可以形成不同的例如无监督学习、密切关系金传播和由MILK支持的K-means聚类等分类系统。

11.IEPY

www.github.com/machinalis/iepy

IEPY是一个专注于关系抽取的开源性信息抽取工具。它主要针对的是需要对大型数据集进行信息提取的用户和想要尝试新的算法的科学家。

12.Quepy

www.github.com/machinalis/quepy

Quepy是通过改变自然语言问题从而在数据库查询语言中进行查询的一个Python框架。他可以简单的被定义为在自然语言和数据库查询中不同类型的问题。所以，你不用编码就可以建立你自己的一个用自然语言进入你的数据库的系统。

现在Quepy提供对于Sparql和MQL查询语言的支持。并且计划将它延伸到其他的数据库查询语言。

13.Hebel

www.github.com/hannes-brt/hebel

Hebel是在Python语言中对于神经网络的深度学习的一个库程序，它使用的是通过PyCUDA来进行GPU和CUDA的加速。它是最重要的神经网络模型的类型的工具而且能提供一些不同的活动函数的激活功能，例如动力，涅斯捷罗夫动力，信号丢失和停止法。

14.mlxtend

www.github.com/rasbt/mlxtend

它是一个由有用的工具和日常数据科学任务的扩展组成的一个库程序。

15.nolearn

www.github.com/dnouri/nolearn

这个程序包容纳了大量能对你完成机器学习任务有帮助的实用程序模块。其中大量的模块和scikit-learn一起工作，其它的通常更有用。

16.Ramp

www.github.com/kvh/ramp

Ramp是一个在Python语言下制定机器学习中加快原型设计的解决方案的库程序。他是一个轻型的pandas-based机器学习中可插入的框架，它现存的Python语言下的机器学习和统计工具（比如scikit-learn,rpy2等）Ramp提供了一个简单的声明性语法探索功能从而能够快速有效地实施算法和转换。

17.Feature Forge

www.github.com/machinalis/featureforge

这一系列工具通过与scikit-learn兼容的API，来创建和测试机器学习功能。

这个库程序提供了一组工具，它会让你在许多机器学习程序使用中很受用。当你使用scikit-learn这个工具时，你会感觉到受到了很大的帮助。（虽然这只能在你有不同的算法时起作用。）

18.REP

www.github.com/yandex/rep

REP是以一种和谐、可再生的方式为指挥数据移动驱动所提供的一种环境。

它有一个统一的分类器包装来提供各种各样的操作，例如TMVA, Sklearn, XGBoost, uBoost等等。并且它可以在一个群体以平行的方式训练分类器。同时它也提供了一个交互式的情节。

19.Python 学习机器样品

www.github.com/awslabs/machine-learning-samples

用亚马逊的机器学习建造的简单软件收集。

20.Python-ELM

www.github.com/dclambert/Python-ELM


xgboost 
https://www.analyticsvidhya.com/blog/2016/03/complete-guide-parameter-tuning-xgboost-with-codes-python/

Statsmodels
Statsmodels是另一个聚焦在统计模型上的强大的库，主要用于预测性和探索性分析。如果你想拟合线性模型、进行统计分析，或者预测性建模，那么Statsmodels非常适合。它提供的统计测试相当全面，覆盖了大部分情况的验证任务。如果你是R或者S的用户，它也提供了某些统计模型的R语法。它的模型同时也接受Numpy数组和Pandas数据帧，让中间数据结构成为过去！

PyMC
PyMC是做贝叶斯曲线的工具。它包含贝叶斯模型、统计分布和模型收敛的诊断工具，也包含一些层次模型。如果想进行贝叶斯分析，你应该看看。

Shogun
Shogun是个聚焦在支持向量机（Support Vector Machines, SVM）上的机器学习工具箱，用C++编写。它正处于积极开发和维护中，提供了Python接口，也是文档化最好的接口。但是，相对于Scikit-learn，我们发现它的API比较难用。而且，也没提供很多开箱可用的诊断和求值算法。但是，速度是个很大的优势。

Gensim
Gensim被定义为“人们的主题建模工具（topic modeling for humans）”。它的主页上描述，其焦点是狄利克雷划分（Latent Dirichlet Allocation， LDA）及变体。不同于其他包，它支持自然语言处理，能将NLP和其他机器学习算法更容易组合在一起。如果你的领域在NLP，并想进行聚集和基本的分类，你可以看看。目前，它们引入了Google的基于递归神经网络（Recurrent Neural Network）的文本表示法word2vec。这个库只使用Python编写。

Orange
Orange是这篇文章列举的所有库中唯一带有图形用户界面（Graphical User Interface，GUI）的。对分类、聚集和特征选择方法而言，它是相当全面的，还有些交叉验证的方法。在某些方面比Scikit-learn还要好（分类方法、一些预处理能力），但与其他科学计算系统（Numpy, Scipy, Matplotlib, Pandas）的适配上比不上Scikit-learn。

但是，包含GUI是个很重要的优势。你可以可视化交叉验证的结果、模型和特征选择方法（某些功能需要安装Graphviz）。对大多数算法，Orange都有自己的数据结构，所以你需要将数据包装成Orange兼容的数据结构，这使得其学习曲线更陡。

PyMVPA
PyMVPA是另一个统计学习库，API上与Scikit-learn很像。包含交叉验证和诊断工具，但是没有Scikit-learn全面。

深度学习
尽管深度学习是机器学习的一个子节，我们在这里创建单独一节的原因是，它最新吸引了Google和Facebook人才招聘部门的很多注意。

Theano
Theano是最成熟的深度学习库。它提供了不错的数据结构（张量，tensor）来表示神经网络的层，对线性代数来说很高效，与Numpy的数组类似。需要注意的是，它的API可能不是很直观，用户的学习曲线会很高。有很多基于Theano的库都在利用其数据结构。它同时支持开箱可用的GPU编程。

PyLearn2
还有另外一个基于Theano的库，PyLearn2，它给Theano引入了模块化和可配置性，你可以通过不同的配置文件来创建神经网络，这样尝试不同的参数会更容易。可以说，如果分离神经网络的参数和属性到配置文件，它的模块化能力更强大。

Decaf
Decaf是最近由UC Berkeley发布的深度学习库，在Imagenet分类挑战中测试发现，其神经网络实现是很先进的（state of art）。

Nolearn
如果你想在深度学习中也能使用优秀的Scikit-learn库API，封装了Decaf的Nolearn会让你能够更轻松地使用它。它是对Decaf的包装，与Scikit-learn兼容（大部分），使得Decaf更不可思议。

OverFeat
OverFeat是最近猫vs.狗（kaggle挑战）的胜利者，它使用C++编写，也包含一个Python包装器（还有Matlab和Lua）。通过Torch库使用GPU，所以速度很快。也赢得了ImageNet分类的检测和本地化挑战。如果你的领域是计算机视觉，你可能需要看看。

Hebel
Hebel是另一个带有GPU支持的神经网络库，开箱可用。你可以通过YAML文件（与Pylearn2类似）决定神经网络的属性，提供了将神级网络和代码友好分离的方式，可以快速地运行模型。由于开发不久，就深度和广度上说，文档很匮乏。就神经网络模型来说，也是有局限的，因为只支持一种神经网络模型（正向反馈，feed-forward）。但是，它是用纯Python编写，将会是很友好的库，因为包含很多实用函数，比如调度器和监视器，其他库中我们并没有发现这些功能。

Neurolab
NeuroLab是另一个API友好（与Matlabapi类似）的神经网络库。与其他库不同，它包含递归神经网络（Recurrent Neural Network，RNN）实现的不同变体。如果你想使用RNN，这个库是同类API中最好的选择之一。

```py
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn import * #机器学习库
np.random.seed(123) #设置随机数种子

iris=pd.read_csv("C:\\Users\\Administrator\\Desktop\\iris.csv",header=False) 
#操作请注意:输入文件实际路径
print iris.shape #输出数据维度
print iris.head() #查看前5行
print iris.describe().T #描述性统计

#聚类分析
irisK3=cluster.KMeans(n_clusters=3,random_state=1) #分为3类
irisFeatures=iris.ix[:,1:4] #去掉Name列
#print irisFeatures.head()
irisK3.fit(irisFeatures) 
print irisK3.labels_ #输出聚类结果

# 决策树模型
target=iris["Name"] #目标变量
data=iris.ix[:,1:4] #自变量
train_data,test_data,train_target,test_target=cross_validation.train_test_split(data,
                target,test_size=0.24,random_state=0) #分成训练集、测试集（占0.24）
clf=tree.DecisionTreeClassifier(criterion='gini', max_depth=6, 
                                  min_samples_split=5) #CART算法
clf_fit=clf.fit(train_data, train_target) #开始fit
#print clf_fit
train_est=clf.predict(train_data) #预测训练集
test_est=clf.predict(test_data) #预测测试集
sum=0 
for i in range(36):    
    if test_est[i]==test_target[i]:
        sum=sum+1        
print 'test_accuracy=',"%.2f%%"%(sum*1.0/36*100) #测试集预测正确率

sum=0 
for i in range(114):    
    if train_est[i]==train_target[i]:
        sum=sum+1        
print 'tarin_accuracy=',"%.2f%%"%(sum*1.0/114*100) #训练集预测正确率

```

# 常用函数
```py

1.常用内置函数：(不用import就可以直接使用)  
    help(obj) 在线帮助, obj可是任何类型 
    callable(obj) 查看一个obj是不是可以像函数一样调用 
    repr(obj) 得到obj的表示字符串，可以利用这个字符串eval重建该对象的一个拷贝 
    eval_r(str) 表示合法的python表达式，返回这个表达式 
    dir(obj) 查看obj的name space中可见的name 
    hasattr(obj,name) 查看一个obj的name space中是否有name 
    getattr(obj,name) 得到一个obj的name space中的一个name 
    setattr(obj,name,value) 为一个obj的name space中的一个name指向vale这个object 
    delattr(obj,name) 从obj的name space中删除一个name 
    vars(obj) 返回一个object的name space。用dictionary表示 
    locals() 返回一个局部name space,用dictionary表示 
    globals() 返回一个全局name space,用dictionary表示 
    type(obj) 查看一个obj的类型 
    isinstance(obj,cls) 查看obj是不是cls的instance 
    issubclass(subcls,supcls) 查看subcls是不是supcls的子类 
    
  类型转换函数 
    chr(i) 把一个ASCII数值,变成字符 
    ord(i) 把一个字符或者unicode字符,变成ASCII数值 
    oct(x) 把整数x变成八进制表示的字符串 
    hex(x) 把整数x变成十六进制表示的字符串 
    str(obj) 得到obj的字符串描述 
    list(seq) 把一个sequence转换成一个list 
    tuple(seq) 把一个sequence转换成一个tuple 
    dict(),dict(list) 转换成一个dictionary 
    int(x) 转换成一个integer 
    long(x) 转换成一个long interger 
    float(x) 转换成一个浮点数 
    complex(x) 转换成复数 
    max(...) 求最大值 
    min(...) 求最小值 
  用于执行程序的内置函数 
    complie 如果一段代码经常要使用,那么先编译,再运行会更快。 
    
2.和操作系统相关的调用 
  系统相关的信息模块 import sys 
    sys.argv是一个list,包含所有的命令行参数. 
    sys.stdout sys.stdin sys.stderr 分别表示标准输入输出,错误输出的文件对象. 
    sys.stdin.readline() 从标准输入读一行 sys.stdout.write("a") 屏幕输出a 
    sys.exit(exit_code) 退出程序 
    sys.modules 是一个dictionary，表示系统中所有可用的module 
    sys.platform 得到运行的操作系统环境 
    sys.path 是一个list,指明所有查找module，package的路径. 
    
  操作系统相关的调用和操作 import os 
    os.environ 一个dictionary 包含环境变量的映射关系 os.environ["HOME"] 可以得到环境变量HOME的值 
    os.chdir(dir) 改变当前目录 os.chdir('d:\\outlook') 注意windows下用到转义 
    os.getcwd() 得到当前目录 
    os.getegid() 得到有效组id  os.getgid() 得到组id 
    os.getuid() 得到用户id  os.geteuid() 得到有效用户id 
    os.setegid os.setegid() os.seteuid() os.setuid() 
    os.getgruops() 得到用户组名称列表 
    os.getlogin() 得到用户登录名称 
    os.getenv 得到环境变量 
    os.putenv 设置环境变量 
    os.umask 设置umask 
    os.system(cmd) 利用系统调用，运行cmd命令 
    操作举例： 
      os.mkdir('/tmp/xx') os.system("echo 'hello' > /tmp/xx/a.txt") os.listdir('/tmp/xx') 
      os.rename('/tmp/xx/a.txt','/tmp/xx/b.txt') os.remove('/tmp/xx/b.txt') os.rmdir('/tmp/xx') 
      用python编写一个简单的shell 
        #!/usr/bin/python 
        import os, sys 
        cmd = sys.stdin.readline() 
        while cmd: 
            os.system(cmd) 
            cmd = sys.stdin.readline() 
            
  用os.path编写平台无关的程序 
    os.path.abspath("1.txt") == os.path.join(os.getcwd(), "1.txt") 
    os.path.split(os.getcwd()) 用于分开一个目录名称中的目录部分和文件名称部分。 
    os.path.join(os.getcwd(), os.pardir, 'a', 'a.doc') 全成路径名称. 
      os.pardir 表示当前平台下上一级目录的字符 .. 
    os.path.getctime("/root/1.txt")  返回1.txt的ctime(创建时间)时间戳 
    os.path.exists(os.getcwd()) 判断文件是否存在 
    os.path.expanduser('~/dir') 把~扩展成用户根目录 
    os.path.expandvars('$PATH') 扩展环境变量PATH 
    os.path.isfile(os.getcwd()) 判断是否是文件名，1是0否 
    os.path.isdir('c:\Python26\temp') 判断是否是目录,1是0否 
    os.path.islink('/home/huaying/111.sql') 是否是符号连接 windows下不可用 
    os.path.ismout(os.getcwd()) 是否是文件系统安装点 windows下不可用 
    os.path.samefile(os.getcwd(), '/home/huaying') 看看两个文件名是不是指的是同一个文件 
    os.path.walk('/home/huaying', test_fun, "a.c")  
      遍历/home/huaying下所有子目录包括本目录,对于每个目录都会调用函数test_fun. 
      例：在某个目录中，和他所有的子目录中查找名称是a.c的文件或目录。 
        def test_fun(filename, dirname, names): //filename即是walk中的a.c dirname是访问的目录名称 
            if filename in names: //names是一个list,包含dirname目录下的所有内容 
                print os.path.join(dirname, filename) 
        os.path.walk('/home/huaying', test_fun, "a.c") 
        
  文件操作 
    打开文件 
      f = open("filename", "r") r只读 w写 rw读写 rb读二进制 wb写二进制 w+写追加 
    读写文件 
      f.write("a") f.write(str) 写一字符串 f.writeline() f.readlines() 与下read类同 
      f.read() 全读出来 f.read(size) 表示从文件中读取size个字符 
      f.readline() 读一行,到文件结尾,返回空串. f.readlines() 读取全部，返回一个list. list每个元素表示一行，包含"\n"\ 
      f.tell() 返回当前文件读取位置 
      f.seek(off, where) 定位文件读写位置. off表示偏移量，正数向文件尾移动，负数表示向开头移动。 
        where为0表示从开始算起,1表示从当前位置算,2表示从结尾算. 
      f.flush() 刷新缓存 
    关闭文件 
      f.close() 

```