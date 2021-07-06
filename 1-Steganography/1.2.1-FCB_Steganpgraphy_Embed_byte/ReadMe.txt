命令行参数示例
StegaographyFCB MR122 Test.pcm Test.amr Msg.txt

MR122 编码模式
Test.pcm 输入的正常文件
Test.amr 输出的隐写文件
Msg.txt 输入的消息文件

注意
1，输入必须是 8k 采样，16bit Mono 格式

2，如果嵌入成功，会返回消息个数。
格式如下：
"ONLY Embed 1 bytes."
该参数用于提取。



