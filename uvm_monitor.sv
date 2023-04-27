class test_mon extends uvm_monitor;
  
  `uvm_ananlysis_port#(mux_sequence) to_drv_from_mon;
  //Factory
  `uvm_components_utils(test_mon);
  
  //New constructor
  function new (string name = "test_mon" , uvm_component parent = null);
    super.new(name,parent);
    //Create analysis port handle
  endfunction 
  
  //
  
endclass : test_mon
