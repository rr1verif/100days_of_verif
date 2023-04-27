class uvm_test_env extends uvm_env;
  
  `uvm_component_utils(uvm_test_env);
  
  function new (string name = "uvm_test_env" , uvm_component parent = null);
    super.new(name,parent);
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    //Add code here
  endfunction
  
  function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);
    //Add connection here
  endfunction
  
  task run_phase (uvm_phase phase)
    //Add Simulation related code here
  endtask
  
endclass
