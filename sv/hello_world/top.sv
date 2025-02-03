
module top;
    import pss_top__Entry_pkg::*;

    initial begin
        automatic pss_top__Entry actor = new();
        actor.run();
        $finish;
    end

endmodule


