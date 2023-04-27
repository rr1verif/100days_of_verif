class test_mon extends uvm_monitor;
  
  `uvm_ananlysis_port #(mux_sequence) mon_to_chkr;
  //Factory
  `uvm_components_utils(test_mon);
  
  //New constructor
  function new (string name = "test_mon" , uvm_component parent = null);
    super.new(name,parent);
    //Create analysis port handle
    mon_to_chkr = new("analysis_port", this);
  endfunction 
  
  //Logic for run_phase
  task run_phase(uvm_phase phase);
    //Define a virtual interface handle named vif
    
    //Define a new object of mux_sequence type
    mux_sequence mux_seq_1;
    //forever loop
    forever begin //{
      if (vif.clk) begin //{
        //Assign interface signals to the object fields
        mux_seq_1.input1 = vif.input1;
        mux_seq_1.input2 = vif.input2;
        mux_seq_1.sel1   = vif.sel1;
        //Call the write function and push the packet
        mon_to_chkr.write(mux_seq_1);
        `uvm_info(get_type_name(),$sformatf("Packet written to checker is %p", mux _seq_1),UVM_LOW);
      end //}
    end //}
  endtask: run_phase
  
endclass : test_mon
