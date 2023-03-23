# Pipelined-CPU-Design
模擬CPU Pipelined

Architecture:

![image](https://github.com/LizhuChen/Pipelined-CPU-Design/blob/main/img/architecture.PNG)

設計說明:

1.	IF_ID : 
暫存 pc_incr（PC的值）、inst（Instruction Memory 的值）。

2.	ID_EX : 
暫存 pc_add_4（PC=PC+4的值）、RD1（讀取的記憶體資料）、RD2（讀取的記憶體資料）、rt（來源暫存器）、rd（目的暫存器）、Extend（擴充值）、RegDst（控制RFMUX）、ALUSrc（控制ALUMUX）、MemtoReg（控制WRMUX）、RegWrite（控制暫存器是否可寫入）、MemRead（控制記憶體是否可讀出）、MemWrite（控制記憶體是否可寫入）、ALUOp（輸出至ALU Control）。

3.	EX_MEM :
暫存 MemtoReg（控制WRMUX）、RegWrite（控制暫存器是否可寫）、dmem_rdata（DataMemory存入的data值）、 ALUoutput（ALU運算完的值）、reg_dst（控制RFMUX）。

4.	MEM_WB :
暫存 MemtoReg（控制WRMUX）、 RegWrite（控制暫存器是否可寫）、MemRead（控制記憶體是否可讀出）、 MemWrite（控制記憶體是否可寫入）、IDAdder（ID+Extend的值）、ALUZero（ALU輸出的zero訊號）、 ALU、RD2、rt_rd。

5.	mips_single :
第一階：傳入PC的值，表示正在執行的位址，抓取指令寫入Instruction Memory並暫存到第一階管線IF_ID ，再將PC與4做ADD傳回PC準備做下一道指令。第二階：解碼指令，判斷指令為r-type、i-type或jump，設定要使用的暫存器及是否位元擴充，寫入Register File並暫存到第二階管線ID_EX。第三階：判斷要傳入ALU執行指令運算或是將位址位移，並暫存到第三階管線EX_MEM。第四階：判斷是否寫入Data Memory或是執行branch，並暫存到第四階管線MEM_WB。第五階：將結果寫回Register File。

6.	ALU :
沿用MidProject，運算AND、OR、SUB、ADD、SLT、SLL、HI、LO指令，另外新增ADDIU、BEQ、BNE、JUMP、LW、SW及NOP指令。

7.	Mutipler :
傳入32bits乘數與被乘數及時序及reset，若reset為1的話就代表需要重新做一次並設定start為1，若是start為1的話，就將nowbit設為32並初始化需要用到的空間，如果乘數當前的bit為1的話，就將被乘數加上當前的product，再將乘數右移1，被乘數左移1並將nowbit減一，重複此動作，直到nowbit為0。最後得到64bits的結果。
 


Modelsim 驗證結果與 Waveform 輸出圖形

![image](https://github.com/LizhuChen/Pipelined-CPU-Design/blob/main/img/output.png)

![image](https://github.com/LizhuChen/Pipelined-CPU-Design/blob/main/img/output2.png)
