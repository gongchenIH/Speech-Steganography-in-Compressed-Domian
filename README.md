# 压缩域语音隐写

​        该仓库包括一些经典的压缩域音频隐写算法和隐写分析算法

## 说明

​        压缩域语音相对于时域语音更具有实用和研究意义，压缩域语音隐写和隐写分析是信息隐藏领域研究的热点和难点。压缩域语音是互联网中，特别是社交应用中一类常见的媒体，在这些媒体隐藏信息不容易引起他人的怀疑；压缩域语音载体拥有比较大的冗余空间，适合嵌入隐秘消息；由于语音编码算法固有特性，编码参数小幅度的修改对后生成文件的量的影响仍然 能够维持在人类听觉感知条件下，在适度嵌入率下，人耳几乎不能区别正常载体 还是隐写载体。

​        目前常见的语音编 码标准，比如 G.723.1,G.729,iLBC,AMR 等等，通常是以 ACELP（Algebraic Code Excited Linear Prediction）为原因编码原理，ACELP 算法的主要参数包括固定码本（FCB），自适应码本 (ACB) 和自适应码本 (LPC)。与之对应 的是，三个嵌入域。

​        相对于时域语音，压缩域语音的相关资源更缺乏。 该项目以嵌入域为节点，分别从正向和反向提供经典的隐写算法。其中正向算法，出于多种因素考虑，只提供了可执行程序版本，并且只能嵌入（提取）1字节消息。如果个人感兴趣可以自己提取相应参数的LSB位，与提取的消息做对比；反向算法，包括3个嵌入域固定码本，自适应码本和自适应码本，并同时提供了MATLAB和Python不同版本。

​        仓库会及时更新，如有任何问题，欢迎联系。

## 算法

​    该仓库提供的相应代码可以参考以下论文：

### 1. 固定码本

#### 1.1 隐写算法

- **Geiser**: Bernd Geiser and Peter Vary. 2008. High rate data hiding in ACELP speech codecs. In Acoustics, Speech and Signal Processing, 2008. ICASSP 2008. IEEE International Conference on. IEEE, 4005–4008

- **Miao**: Haibo Miao, Liusheng Huang, Zhili Chen, Wei Yang, and Ammar Al-Hawbani. 2012. A new scheme for covert communication via 3G encoded speech. Computers & Electrical Engineering 38, 6 (2012), 1490–1501.

- **AFA**: Yanzhen Ren, Hongxia Wu, and Lina Wang. 2018. An AMR adaptive steganography algorithm based on minimizing distortion. Multimedia Tools and Applications 77, 10 (2018), 12095–12110.

#### 1.2 隐写分析算法

- **Fast-SPP**: Yanzhen Ren, Tingting Cai, Ming Tang, and Lina Wang. 2015. AMR steganalysis based on the probability of same pulse position. IEEE Transactions on Information Forensics and Security 10, 9 (2015), 1801–1811.

- **MTJCE**:  Haibo Miao, Liusheng Huang, Yao Shen, Xiaorong Lu, and Zhili Chen. 2013. Steganalysis of compressed speech based on Markov and entropy. In International Workshop on Digital Watermarking. Springer, 63–76.

- **SRCNet**: Chen Gong, Xiaowei Yi, Xianfeng Zhao and Yi Ma,  (2019, July). Recurrent convolutional neural networks for AMR steganalysis based on pulse position. In *Proceedings of the ACM Workshop on Information Hiding and Multimedia Security* (pp. 2-13).

#### 2.自适应码本

#### 1.1 隐写算法

- **Geiser**: Bernd Geiser and Peter Vary. 2008. High rate data hiding in ACELP speech codecs. In Acoustics, Speech and Signal Processing, 2008. ICASSP 2008. IEEE International Conference on. IEEE, 4005–4008

- **Miao**: Haibo Miao, Liusheng Huang, Zhili Chen, Wei Yang, and Ammar Al-Hawbani. 2012. A new scheme for covert communication via 3G encoded speech. Computers & Electrical Engineering 38, 6 (2012), 1490–1501.

- **AFA**: Yanzhen Ren, Hongxia Wu, and Lina Wang. 2018. An AMR adaptive steganography algorithm based on minimizing distortion. Multimedia Tools and Applications 77, 10 (2018), 12095–12110.

#### 1.2 隐写分析算法

- **Fast-SPP**: Yanzhen Ren, Tingting Cai, Ming Tang, and Lina Wang. 2015. AMR steganalysis based on the probability of same pulse position. IEEE Transactions on Information Forensics and Security 10, 9 (2015), 1801–1811.

- **MTJCE**:  Haibo Miao, Liusheng Huang, Yao Shen, Xiaorong Lu, and Zhili Chen. 2013. Steganalysis of compressed speech based on Markov and entropy. In International Workshop on Digital Watermarking. Springer, 63–76.

- **SRCNet**: Chen Gong, Xiaowei Yi, Xianfeng Zhao and Yi Ma,  (2019, July). Recurrent convolutional neural networks for AMR steganalysis based on pulse position. In *Proceedings of the ACM Workshop on Information Hiding and Multimedia Security* (pp. 2-13).

#### 3. 自适应码本

#### 3.1 隐写算法

- **Xiao**: Bo Xiao, Yongfeng Huang and Shanyu Tang, “[An approach to information hiding in low bit-rate speech stream](https://ieeexplore.ieee.org/author/37849377500),” in Proc. IEEE Global Telecommun. Conf. (GLOBECOM), Nov. 2008, pp. 1–5.


#### 3.2 隐写分析算法

- **SS-QCCN**:  Songbin Li, Y. Jia, and C.-C. J. Kuo, “Steganalysis of QIM steganography in low-bit-rate speech signals,” IEEE/ACM Trans. Audio, Speech, Language Process., vol. 25, no. 5, pp. 1011–1022, May 2017.

# Speech Steganography in Time Domain

The library includes some classic algorithms audio steganography  in time domain written in Matlab.

## About

​    Compared with time domain speech, compressed domain speech has more practical and research significance. Compressed domain speech steganography and steganalysis are the hot-spots and difficulties in the field of information hiding. Compressed domain voice is a common medium in the Internet, especially in social applications. It is not easy to cause others to suspect that information is hidden in these media; the compressed domain voice carrier has a relatively large redundant space and is suitable for embedding secret messages; due to voice coding The inherent characteristics of the algorithm, the impact of small modification of coding parameters on the amount of generated files can still be maintained under the conditions of human auditory perception, and at a moderate embedding rate, the human ear can hardly distinguish between normal carriers and steganographic carriers.

​    The current common speech coding standards, such as G.723.1, G.729, iLBC, AMR, etc., are usually based on the ACELP (Algebraic Code Excited Linear Prediction) coding principle. The main parameters of the ACELP algorithm include fixed codebook (FCB) , Adaptive Codebook (ACB) and Linear Predictive Coefficient (LPC). Corresponding to it are three embedded domains.

​    Compared with time domain speech, the related resources of compressed domain speech are even more lacking. The project takes the embedded domain as the node, and provides classic steganography algorithms from the forward and reverse directions. Among them, the forward algorithm, due to many factors, only provides an executable program version, and can only embed (extract) a 1-byte message. If you are interested, you can extract the LSB bit of the corresponding parameter by yourself and compare it with the extracted message; the reverse algorithm includes 3 embedded domain fixed codebooks, adaptive codebooks and adaptive codebooks, and also provides MATLAB and Python different versions.

​    The warehouse will be updated in time, if you have any questions, please feel free to contact us.



## Algorithms

#### 1. Fixed Codebook

#### 1.1 Stegaography

- **Geiser**: Bernd Geiser and Peter Vary. 2008. High rate data hiding in ACELP speech codecs. In Acoustics, Speech and Signal Processing, 2008. ICASSP 2008. IEEE International Conference on. IEEE, 4005–4008

- **Miao**: Haibo Miao, Liusheng Huang, Zhili Chen, Wei Yang, and Ammar Al-Hawbani. 2012. A new scheme for covert communication via 3G encoded speech. Computers & Electrical Engineering 38, 6 (2012), 1490–1501.

- **AFA**: Yanzhen Ren, Hongxia Wu, and Lina Wang. 2018. An AMR adaptive steganography algorithm based on minimizing distortion. Multimedia Tools and Applications 77, 10 (2018), 12095–12110.

#### 1.2 Steganalysis

- **Fast-SPP**: Yanzhen Ren, Tingting Cai, Ming Tang, and Lina Wang. 2015. AMR steganalysis based on the probability of same pulse position. IEEE Transactions on Information Forensics and Security 10, 9 (2015), 1801–1811.

- **MTJCE**:  Haibo Miao, Liusheng Huang, Yao Shen, Xiaorong Lu, and Zhili Chen. 2013. Steganalysis of compressed speech based on Markov and entropy. In International Workshop on Digital Watermarking. Springer, 63–76.

- **SRCNet**: Chen Gong, Xiaowei Yi, Xianfeng Zhao and Yi Ma,  (2019, July). Recurrent convolutional neural networks for AMR steganalysis based on pulse position. In *Proceedings of the ACM Workshop on Information Hiding and Multimedia Security* (pp. 2-13).

#### 2. Adaptive Codebook

#### 1.1 Stegaography

- **Geiser**: Bernd Geiser and Peter Vary. 2008. High rate data hiding in ACELP speech codecs. In Acoustics, Speech and Signal Processing, 2008. ICASSP 2008. IEEE International Conference on. IEEE, 4005–4008

- **Miao**: Haibo Miao, Liusheng Huang, Zhili Chen, Wei Yang, and Ammar Al-Hawbani. 2012. A new scheme for covert communication via 3G encoded speech. Computers & Electrical Engineering 38, 6 (2012), 1490–1501.

- **AFA**: Yanzhen Ren, Hongxia Wu, and Lina Wang. 2018. An AMR adaptive steganography algorithm based on minimizing distortion. Multimedia Tools and Applications 77, 10 (2018), 12095–12110.

#### 1.2 Steganalysis

- **Fast-SPP**: Yanzhen Ren, Tingting Cai, Ming Tang, and Lina Wang. 2015. AMR steganalysis based on the probability of same pulse position. IEEE Transactions on Information Forensics and Security 10, 9 (2015), 1801–1811.

- **MTJCE**:  Haibo Miao, Liusheng Huang, Yao Shen, Xiaorong Lu, and Zhili Chen. 2013. Steganalysis of compressed speech based on Markov and entropy. In International Workshop on Digital Watermarking. Springer, 63–76.

- **SRCNet**: Chen Gong, Xiaowei Yi, Xianfeng Zhao and Yi Ma,  (2019, July). Recurrent convolutional neural networks for AMR steganalysis based on pulse position. In *Proceedings of the ACM Workshop on Information Hiding and Multimedia Security* (pp. 2-13).

#### 3.  Linear Predictive Coefficient

#### 1.1 Stegaography

- **Geiser**: Bernd Geiser and Peter Vary. 2008. High rate data hiding in ACELP speech codecs. In Acoustics, Speech and Signal Processing, 2008. ICASSP 2008. IEEE International Conference on. IEEE, 4005–4008

- **Miao**: Haibo Miao, Liusheng Huang, Zhili Chen, Wei Yang, and Ammar Al-Hawbani. 2012. A new scheme for covert communication via 3G encoded speech. Computers & Electrical Engineering 38, 6 (2012), 1490–1501.

- **AFA**: Yanzhen Ren, Hongxia Wu, and Lina Wang. 2018. An AMR adaptive steganography algorithm based on minimizing distortion. Multimedia Tools and Applications 77, 10 (2018), 12095–12110.

#### 1.2 Steganalysis

- **Fast-SPP**: Yanzhen Ren, Tingting Cai, Ming Tang, and Lina Wang. 2015. AMR steganalysis based on the probability of same pulse position. IEEE Transactions on Information Forensics and Security 10, 9 (2015), 1801–1811.

- **MTJCE**:  Haibo Miao, Liusheng Huang, Yao Shen, Xiaorong Lu, and Zhili Chen. 2013. Steganalysis of compressed speech based on Markov and entropy. In International Workshop on Digital Watermarking. Springer, 63–76.

- **SRCNet**: Chen Gong, Xiaowei Yi, Xianfeng Zhao and Yi Ma,  (2019, July). Recurrent convolutional neural networks for AMR steganalysis based on pulse position. In *Proceedings of the ACM Workshop on Information Hiding and Multimedia Security* (pp. 2-13).
