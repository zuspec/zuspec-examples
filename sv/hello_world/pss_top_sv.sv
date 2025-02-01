`include "zsp_sv_macros.svh"
package pss_types;
    import zsp_sv::*;
    
    typedef class pss_import_api;
    // TODO: define model-specific executor class
    typedef executor_base executor_base_c;
    typedef executor_base executor_t;
    typedef class pss_top;
    typedef class pss_top__Hello;
    
    class pss_top extends component_c;
        `zsp_typed_obj_util(pss_top)
        
        function new(string name, component_ctor_ctxt ctxt, component_c parent=null);
            super.new(name, ctxt, parent);
            
            if (ctxt != null) begin
                ctxt.enter(this);
            end
            executor_m = new[ctxt.executor_m.size()](ctxt.executor_m);
            // Note: 'enter' handled by the component_c constructor
            ctxt.leave(this);
        endfunction
        
        
        
        function void do_init(executor_base exec_b);
            init_down(exec_b);
            init_up(exec_b);
        endfunction
        
        
        
        virtual function bit check();
            bit ret = 1;
            return ret;
        endfunction
    endclass
    
    typedef class pss_top;
    class pss_top__Hello extends action_c;
        `zsp_typed_obj_util(pss_top__Hello)
        `zsp_action_comp_type(pss_top)
        pss_top comp;
        
        function new();
        endfunction
        
        
        
        
        function void do_pre_solve();
            pre_solve();
        endfunction
        function void post_solve(executor_base exec_b);
            executor_t executor;
            $cast(executor, exec_b);
            begin
                `zsp_print(exec_b, ("Hello World (1)\n"));
            end
        endfunction
        
        function void do_post_solve(executor_base exec_b);
            post_solve(exec_b);
        endfunction
        task body(executor_base exec_b);
            executor_t executor;
            $cast(executor, exec_b);
            begin
                `zsp_message(exec_b, 32'h0, ("Hello World!"));
            end
        endtask
        
        virtual function void set_component(component_c comp);
            $cast(this.comp, comp);
        endfunction
        
        virtual function component_c get_component();
            return this.comp;
        endfunction
        
    endclass
    
    
    
    class pss_import_api #(type BaseT=zsp_sv::empty_t) extends backend_api #(BaseT);
    endclass
    
endpackage
`include "zsp_sv_macros.svh"
package pss_top__Entry_prv;
    import zsp_sv::*;
    import pss_types::*;
    
    typedef class pss_top__Entry_actor;
    typedef pss_top__Entry_actor actor_t;
    typedef class activity_0x37127930;
    
    class activity_0x37127930 extends activity_c;
        function new(actor_c actor, component_c parent_comp);
            super.new(actor, parent_comp);
        endfunction
        
        virtual task run();
            // Traverse action pss_top::Hello
            begin
                activity_traverse_c #(pss_top__Hello) activity = new(actor, parent_comp);
                activity.run();
                activity.dtor();
            end

        endtask
        
    endclass
    class pss_top__Entry_actor extends actor_c;
        pss_top comp_tree;
        pss_import_api api;
        executor_base_c default_executor;
        
        function new(pss_import_api api=null);
            component_ctor_ctxt ctxt = new(this, 0);
            super.new("<actor>", null, null);
            this.api = api;
            this.default_executor = new("default_executor", this);
            comp_tree = new("pss_top", ctxt, this);
        endfunction
        
        virtual task run();
            activity_0x37127930 root_activity = new(this, comp_tree);
            
            comp_tree.init(this.default_executor);
            comp_tree.do_init(this.default_executor);
            
            if (comp_tree.check()) begin
                if (api == null) begin
                    api = new();
                end
                
                comp_tree.start(this.default_executor);
                
                foreach(listeners[i]) begin
                    listeners[i].enter_actor(this);
                end
                
                root_activity.run();
                
                foreach(listeners[i]) begin
                    listeners[i].leave_actor(this);
                end
            end else begin
                $display("Error: initialization check failed");
            end
            
        endtask
        
        virtual function pss_import_api get_api();
            return api;
        endfunction
        
        virtual function executor_base get_default_executor();
            return default_executor;
        endfunction
        
        virtual function backend_api get_backend();
            return api;
        endfunction
    endclass
endpackage
package pss_top__Entry_pkg;
    import zsp_sv::*;
    import pss_top__Entry_prv::*;
    typedef pss_top__Entry_prv::pss_top__Entry_actor pss_top__Entry;
endpackage
