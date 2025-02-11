
package simple_read_write_pkg;
    import pss_types::*;

    class api_impl extends pss_import_api;
        virtual task bfm_write(
            input int unsigned addr,
            input int unsigned data);
            $display("bfm_write: 'h%08h 'h%08h", addr, data);
        endtask

        virtual task bfm_read(
            output int unsigned __retval,
            input int unsigned addr);
            $display("bfm_read: 'h%08h", addr);
            __retval = 42;
        endtask
    endclass

endpackage

module simple_read_write;
    import simple_read_write_pkg::*;
    import pss_top__Entry_pkg::*;

    initial begin
        automatic api_impl api = new();
        pss_top__Entry actor = new(api);

        actor.run();
    end
endmodule
