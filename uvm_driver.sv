class uvm_test_driver extends uvm_driver #(mux_sequence_item);
  //Fatory
  `uvm_components_utils(uvm_test_driver);
  uvm_test_if vif_drv;
  mux_sequence_item mux_sequence_drv;
  
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
    forever begin //{
      seq_item_port.get_next_item(mux_sequence_drv);
      drive_seq(mux_sequence_drv);
      seq_item_port.item_done();
    end //}
  endtask : run_phase

  task drive_seq();
    @posedge vif_drv.clk;
    begin //{ Check whether begin end is required or not
      vif_drv.input_a   = mux_sequence_drv.input1;
      vif_drv.input_b   = mux_sequence_drv.input2;
      vif_drv.input_sel = mux_sequence_drv.sel1;
    end //}
  endtask : drive_seq
       
endclass 
