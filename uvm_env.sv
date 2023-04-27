class uvm_test_env extends uvm_env;
  
  `uvm_component_utils(uvm_test_env);
  
  function new (string name = "uvm_test_env" , uvm_component parent = null);
    super.new(name,parent);
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    //Create an object of uvm_test_mon, uvm_test_chkr
  endfunction
  
  function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);
    //Add connection here
    test_mon.mon_to_chkr.connect(test_chkr.from_mon_to_chkr); //Analysis port to import connection
    test_mon.mon_to_chkr.connect(test_chkr.from_mon_to_chkr_fifo.analysis_export);      //Analysis port to tlm fifo connection
  endfunction
  
  task run_phase (uvm_phase phase);
    //Add Simulation related code here
  endtask
  
endclass
