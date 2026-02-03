`timescale 1ns / 1ps

module tb_stopwatch_watch ();

    // 입력 신호 선언 (reg)
    reg        clk;
    reg        reset;
    reg  [3:0] sw;
    reg        btn_r;
    reg        btn_l;
    reg        btn_u;
    reg        btn_d;




    // 출력 신호 관찰 (wire)
    wire [3:0] fnd_digit;
    wire [7:0] fnd_data;




    // DUT (Device Under Test) 인스턴스화
    top_stopwatch_watch dut (
        .clk(clk),
        .reset(reset),
        .sw(sw),
        .btn_r(btn_r),
        .btn_l(btn_l),
        .btn_u(btn_u),
        .btn_d(btn_d),
        .fnd_digit(fnd_digit),
        .fnd_data(fnd_data)
    );


    // 100MHz 클락 생성 (10ns 주기)
    always #5 clk = ~clk;


    integer i, j, k;


    initial begin
        #0;
        clk = 0;
        reset = 1;


        sw = 4'b0000;
        btn_r = 0;
        btn_l = 0;
        btn_u = 0;
        btn_d = 0;


        #10;
        reset = 0;
        #20;


        //스톱워치 동작 테스트
        sw[0] = 1;  // up 모드
        sw[1] = 1;  // 스톱워치 선택
        sw[2] = 0;  // 초.밀리초 모드


        #10000000;


        for (i = 0;i < 4 ;i = i + 1 ) begin
            
            #10000000;
        end


        #10000000;
       
        for (j = 0;j < 2 ;j = j + 1 ) begin
            btn_u = 1;
            #10000000;
            btn_u = 0;
            #10000000;
        end


        #20;
        sw[0] = 1; // down 모드
        sw[2] = 0; //초.밀리초 모드


        #10000000;
       
        for (k = 0;k < 4 ;k = k + 1 ) begin
            btn_r = 1;  // Run 버튼 누름
            #10000000;
            btn_r = 0;
            #10000000;
        end


        #10000000;
        $stop;
    end




endmodule
