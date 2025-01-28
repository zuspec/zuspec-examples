`include "zsp_sv_macros.svh"
package pss_types;
    import zsp_sv::*;
    
    typedef class pss_import_api;
    // TODO: define model-specific executor class
    typedef executor_base executor_base_c;
    typedef executor_base executor_t;
    typedef class executor_pkg__executor_trait_s;
    typedef class executor_pkg__empty_executor_trait_s;
    typedef class executor_pkg__executor_base_c;
    typedef class addr_reg_pkg__addr_space_base_c;
    typedef class addr_reg_pkg__addr_trait_s;
    typedef class addr_reg_pkg__empty_addr_trait_s;
    typedef class addr_reg_pkg__addr_region_base_s;
    typedef class addr_reg_pkg__addr_claim_base_s;
    typedef class addr_reg_pkg__reg_group_c;
    typedef class pss_top;
    typedef class pss_top__Hello;
    
    class executor_pkg__executor_trait_s extends object;
        
        function new();
        endfunction
        
        virtual function void dtor();
        endfunction
        
        virtual function void init(executor_base exec_b);
        endfunction
        virtual function void __assign__(executor_pkg__executor_trait_s rhs);
        endfunction
        
        static function executor_pkg__executor_trait_s create_default();
            executor_pkg__executor_trait_s ret = new();
            return ret;
        endfunction
        
        static function executor_pkg__executor_trait_s create_init();
            executor_pkg__executor_trait_s ret = new();
            return ret;
        endfunction
        function void do_pre_solve();
            pre_solve();
        endfunction
        function void do_post_solve(executor_base exec_b);
            post_solve(exec_b);
        endfunction
    endclass
    
    class executor_pkg__empty_executor_trait_s extends object;
        
        function new();
        endfunction
        
        virtual function void dtor();
        endfunction
        
        virtual function void init(executor_base exec_b);
        endfunction
        virtual function void __assign__(executor_pkg__empty_executor_trait_s rhs);
        endfunction
        
        static function executor_pkg__empty_executor_trait_s create_default();
            executor_pkg__empty_executor_trait_s ret = new();
            return ret;
        endfunction
        
        static function executor_pkg__empty_executor_trait_s create_init();
            executor_pkg__empty_executor_trait_s ret = new();
            return ret;
        endfunction
        function void do_pre_solve();
            pre_solve();
        endfunction
        function void do_post_solve(executor_base exec_b);
            post_solve(exec_b);
        endfunction
    endclass
    
    class executor_pkg__executor_base_c extends component_c;
        `zsp_typed_obj_util(executor_pkg__executor_base_c)
        
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
    
    class addr_reg_pkg__addr_space_base_c extends component_c;
        `zsp_typed_obj_util(addr_reg_pkg__addr_space_base_c)
        
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
    
    class addr_reg_pkg__addr_trait_s extends object;
        
        function new();
        endfunction
        
        virtual function void dtor();
        endfunction
        
        virtual function void init(executor_base exec_b);
        endfunction
        virtual function void __assign__(addr_reg_pkg__addr_trait_s rhs);
        endfunction
        
        static function addr_reg_pkg__addr_trait_s create_default();
            addr_reg_pkg__addr_trait_s ret = new();
            return ret;
        endfunction
        
        static function addr_reg_pkg__addr_trait_s create_init();
            addr_reg_pkg__addr_trait_s ret = new();
            return ret;
        endfunction
        function void do_pre_solve();
            pre_solve();
        endfunction
        function void do_post_solve(executor_base exec_b);
            post_solve(exec_b);
        endfunction
    endclass
    
    class addr_reg_pkg__empty_addr_trait_s extends object;
        
        function new();
        endfunction
        
        virtual function void dtor();
        endfunction
        
        virtual function void init(executor_base exec_b);
        endfunction
        virtual function void __assign__(addr_reg_pkg__empty_addr_trait_s rhs);
        endfunction
        
        static function addr_reg_pkg__empty_addr_trait_s create_default();
            addr_reg_pkg__empty_addr_trait_s ret = new();
            return ret;
        endfunction
        
        static function addr_reg_pkg__empty_addr_trait_s create_init();
            addr_reg_pkg__empty_addr_trait_s ret = new();
            return ret;
        endfunction
        function void do_pre_solve();
            pre_solve();
        endfunction
        function void do_post_solve(executor_base exec_b);
            post_solve(exec_b);
        endfunction
    endclass
    
    
    class addr_reg_pkg__addr_region_base_s extends addr_region_base_s;
        
        function new();
        endfunction
        
        virtual function void dtor();
        endfunction
        
        virtual function void init(executor_base exec_b);
        endfunction
        virtual function void __assign__(addr_reg_pkg__addr_region_base_s rhs);
            size = rhs.size;
        endfunction
        
        static function addr_reg_pkg__addr_region_base_s create_default();
            addr_reg_pkg__addr_region_base_s ret = new();
            return ret;
        endfunction
        
        static function addr_reg_pkg__addr_region_base_s create_init(
                longint unsigned size);
            addr_reg_pkg__addr_region_base_s ret = new();
            ret.size = size;
            return ret;
        endfunction
        function void do_pre_solve();
            pre_solve();
        endfunction
        function void do_post_solve(executor_base exec_b);
            post_solve(exec_b);
        endfunction
    endclass
    
    class addr_reg_pkg__addr_claim_base_s extends object;
        rand bit[63:0] size;
        rand bit permanent;
        
        function new();
        endfunction
        
        virtual function void dtor();
        endfunction
        
        virtual function void init(executor_base exec_b);
        endfunction
        virtual function void __assign__(addr_reg_pkg__addr_claim_base_s rhs);
            size = rhs.size;
            permanent = rhs.permanent;
        endfunction
        
        static function addr_reg_pkg__addr_claim_base_s create_default();
            addr_reg_pkg__addr_claim_base_s ret = new();
            return ret;
        endfunction
        
        static function addr_reg_pkg__addr_claim_base_s create_init(
                longint unsigned size,
                bit permanent);
            addr_reg_pkg__addr_claim_base_s ret = new();
            ret.size = size;
            ret.permanent = permanent;
            return ret;
        endfunction
        constraint c_0x1d2ca130 {
        }
        function void do_pre_solve();
            pre_solve();
        endfunction
        function void do_post_solve(executor_base exec_b);
            post_solve(exec_b);
        endfunction
    endclass
    
    class addr_reg_pkg__reg_group_c extends reg_group_c;
        static addr_reg_pkg__reg_group_c prv_inst;
        
        function new(executor_base exec_b);
            super.new();
            
            map_registers(exec_b);
        endfunction
        
        virtual function longint unsigned get_offset_of_instance(
                input executor_base exec_b,
                input string name);
        endfunction
        
        virtual function longint unsigned get_offset_of_instance_array(
                input executor_base exec_b,
                input string name,
                input int index);
        endfunction
        
        virtual function void set_handle(
                input executor_base exec_b,
                input addr_handle_t addr);
        endfunction
        
        static function addr_reg_pkg__reg_group_c inst(executor_base exec_b);
            if (prv_inst == null) begin
                prv_inst = new(exec_b);
            end
            return prv_inst;
        endfunction
    endclass
    
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
        function void do_post_solve(executor_base exec_b);
            post_solve(exec_b);
        endfunction
        task body(executor_base exec_b);
            executor_t executor;
            $cast(executor, exec_b);
            begin
                begin message_verbosity_e v = message_verbosity_e'(32'h0); if (exec_b.get_actor().verbosity >= v) exec_b.get_api().message($sformatf("Hello World!")); end ;
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
    typedef class activity_0x1d2fc7c0;
    
    class activity_0x1d2fc7c0 extends activity_c;
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
            activity_0x1d2fc7c0 root_activity = new(this, comp_tree);
            
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
