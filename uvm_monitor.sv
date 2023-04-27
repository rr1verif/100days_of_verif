class test_mon extends uvm_monitor;
  
  //Factory
  `uvm_components_utils(test_mon);
  
  //New constructor
  function new (string name = "test_mon" , uvm_component parent = null);
    super.new(name,parent);
    //Create analysis port handle
  endfunction 
  
  //
  
endclass : test_mon
