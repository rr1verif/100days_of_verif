class uvm_test_driver extends uvm_driver #(mux_sequence);
  //Fatory
  `uvm_components_utils(uvm_test_driver);
  uvm_test_if vif_drv;
  
  //New constructor
  function new (string name = "uvm_test_driver", uvm_component parent = null);
    super.new(name);
    
    //Add the code for driving input to the DUT
  endfunction
  
  function void build_phase(uvm_phase phase);
    if(!uvm_config_db(virtual uvm_test_if)::get(this,"","uvm_test_if",vif_drv);
       `uvm_fatal("VIF","Error have you set this interface");
  endfunction
    
  task run_phase(uvm_phase phase);
  endtask : run_phase

  task drive_seq();
  endtask : drive_seq
       
  
endclass 
