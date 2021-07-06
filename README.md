# 压缩域语音隐写

该仓库包括一些经典的压缩域音频隐写算法

## 说明



​        压缩域语音相对于时域语音更具有实用和研究意义，压缩域语音隐写和隐写分析是信息隐藏领域研究的热点和难点。压缩域语音是互联网中，特别是社交应用中一类常见的媒体，在这些媒体隐藏信息不容易引起他人的怀疑；压缩域语音载体拥有比较大的冗余空间，适合嵌入隐秘消息；由于语音编码算法固有特性，编码参数小幅度的修改对后生成文件的量的影响仍然 能够维持在人类听觉感知条件下，在适度嵌入率下，人耳几乎不能区别正常载体 还是隐写载体。

​        目前常见的语音编 码标准，比如 G.723.1,G.729,iLBC,AMR 等等，通常是以 ACELP（Algebraic Code Excited Linear Prediction）为原因编码原理，ACELP 算法的主要参数包括固定码本（FCB），自适应码本 (ACB) 和自适应码本 (LPC)。与之对应 的是，三个嵌入域。

​        相对于时域语音，压缩域语音的相关资源更缺乏。 该项目以嵌入域为节点，分别从正向和反向提供经典的隐写算法。其中正向算法，出于多种因素考虑，只提供了可执行程序版本，并且只能嵌入（提取）1字节消息。如果个人感兴趣可以自己提取相应参数的LSB位，与提取的消息做对比；反向算法，包括3个嵌入域固定码本，自适应码本和自适应码本，并同时提供了MATLAB和Python不同版本。

​        仓库会及时更新，如有任何问题，欢迎联系。

## 算法

#### 1. 固定码本

#### 2.自适应码本

#### 3. 自适应码本



# Speech Steganography in Time Domain

The library includes some classic algorithms audio steganography  in time domain written in Matlab.

## About

​    Compared with time domain speech, compressed domain speech has more practical and research significance. Compressed domain speech steganography and steganalysis are the hotspots and difficulties in the field of information hiding. Compressed domain voice is a common medium in the Internet, especially in social applications. It is not easy to cause others to suspect that information is hidden in these media; the compressed domain voice carrier has a relatively large redundant space and is suitable for embedding secret messages; due to voice coding The inherent characteristics of the algorithm, the impact of small modification of coding parameters on the amount of generated files can still be maintained under the conditions of human auditory perception, and at a moderate embedding rate, the human ear can hardly distinguish between normal carriers and steganographic carriers.

​    The current common speech coding standards, such as G.723.1, G.729, iLBC, AMR, etc., are usually based on the ACELP (Algebraic Code Excited Linear Prediction) coding principle. The main parameters of the ACELP algorithm include fixed codebook (FCB) , Adaptive Codebook (ACB) and Adaptive Codebook (LPC). Corresponding to it are three embedded domains.

​    Compared with time domain speech, the related resources of compressed domain speech are even more lacking. The project takes the embedded domain as the node, and provides classic steganography algorithms from the forward and reverse directions. Among them, the forward algorithm, due to many factors, only provides an executable program version, and can only embed (extract) a 1-byte message. If you are interested, you can extract the LSB bit of the corresponding parameter by yourself and compare it with the extracted message; the reverse algorithm includes 3 embedded domain fixed codebooks, adaptive codebooks and adaptive codebooks, and also provides MATLAB and Python different versions.

​    The warehouse will be updated in time, if you have any questions, please feel free to contact us.



## Algorithms

#### 1. Spread Spectrum
#### 2. Echo Hiding
#### 3. Least Significant Bit Coding
#### 4. Phase Coding
