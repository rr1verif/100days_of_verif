class uvm_test_checker extends uvm_component; //Check whether checker are uvm_component type or anyother type
  
  `uvm_analysis_imp_decl(_from_mon_to_chkr) ;
  
  `uvm_analysis_import #(mux_sequence) from_mon_to_chkr;
  //Add code for analysis fifo 
  `tlm_analysis_fifo #(mux_sequence) from_mon_to_chkr_fifo;
  //Factory
  `uvm_components_utils(uvm_test_checker);
  
  //New Constructor
  function new (string name = "uvm_test_checker", uvm_component parent = null);
    super.new(name,parent);
    //define handle for new analysis import
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    //Can we define handle for analysis import here
    from_mon_to_chkr = new("analysis_import",this);
    from_mon_to_chk_fifo = new("from_mon_to_chkr_fifo",this);
  endfunction
  
  function void write #(mux_sequence seq1); //Analysis import write function
  endfunction
  
  task run_phase(uvm_phase phase);
    //Add code for seq1 processing here
    forever begin //{
      mux_sequence seq2;
      from_mon_to_chkr_fifo.get(seq2)
    end //}
  endtask
    
endclass
