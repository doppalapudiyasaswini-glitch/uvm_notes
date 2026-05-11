-----phases-----
phases:It is used synchronization purpose for different tb component

what is synchronization ?with out  synchronization what happen
ANS) Executing components in aproper order and at the correct time
with out synchronization(race condition,errors,null order and incorrect verification) came to picture

phases can be two types
1) common phases
2)schudle phases
common phases can be:Build Time,Run Time,cleanup

in phases we have 9 type of phases are there 
    *Build phases
	*connect phase
	*end_of_elabration
	*start_of_simulation
	*run_phase
	*extract
	*check
	*report
	*final
Build: components are created,memory allocate for children 
connect: tlm port connection
End_of_elabration: do final change before simulation and also print topology
start _simulation: stimulus are reay to sent DUT
run phase: do all functionality
extract:extract the infromation
check:it check expected behaviour
report:print final report
final:cleanup activities.closing files,releasing memory

---Phase	                    Order	
build_phase	                   Top-Down	
connect_phase	               Bottom-Up	
end_of_elaboration             Bottom-Up	
start_of_simulation            Bottom-Up
run_phase	                   Parallel	(it is task)
extract_phase             	   Bottom-Up	
check_phase	                   Bottom-Up	
report_phase                   Bottom-Up	
final_phase                    Top-Down

---why buildphase is top -down order---
for creating env,test should  be existing
for creating agent,env must exist  it require top down order
----why runis is task----
run phase is time consuming

------schudle phase----
in schulde phase we have
        *main:pre main
		      (post main
	     *reset :pre reset
		         post reset
	     *shutdown:pre shutdwon
		           post shut dwon
 
        * configure:pre configure
		            post congfigure



------ configuration db--------
It is a repository we can store the variables whose access can be provided to the select hierarchies only
  
  here multiple  hierarchies access only one line by using[*]
   variable retrival happen auto matically
   
 before config db there is a issue:user don't have to control on whom to give access and whom not to give access solution:config _db

syntax:uvm_config_db#(data type)::set(context,instant name ,field name,value)--for set
 syntax: uvm_config _db#(datatype)::get(context,instant name,field name,value)

Note:uvm config db set can be called from 3 place in the test bench
1. TB COMPONENT
2.TOP MODULE
3.SEQUNCE
TB COMPONENT:UVM_CONFIG_DB#(DATATYPE)::SET(THIS,"HIERARCHY",COUNT,10);
*NOTE:top module and sequnce tb can not use this here we use uvm_root::get()
TOP MODULE:UVM_CONFIG_DB#(DATATYPE)::SET(uvm_root::get(),"*",COUNT,10);

SEQUENCE:UVM_CONFIG_DB#(DATATYPE)::SET(uvm_root::get(),"*",COUNT,10);

note:uvm config db get can called from 3 place(tb component,top module ,sequnce)
 TOP module: not a vaild  scenario --> we  donot do this
 TB component:uvm_congfig _db#(int)::get (cntxt,"",instant name,value);
 sequnce:UVM_Config_db#(int)::get (null,get_full_name(),"instant",value);
  
Note : 'this' can't be used for context ,since sequnce don't have hierarchy

Q) In top module and sequnce why we cannot use this why we go uvm_root>?










 -------automatic reterieval---------
In  (UVM) uvm_config_db, automatic retrieval happens because UVM internally searches the component hierarchy when get() is called.

 in configuration db  automatic retrieval happen user need to follow some guid line

* how automatic retrieval happen what the guid lines?
guidlines 1.Data type must be same
          2.file nname should be match
		  3.proper hierarchical path
		  4.set must be happen before get

-----Difference between config db and resource db----------
config db                                                 resource db
auto retrieval for integer                           auto retrival not possible in resource db+
based variable

access locally                                       access globaly





imp:so far we are discussed about ,variable set from top a hierarchy and get from a lower hierarchy
     it is possible to do reverse order
	 set from lower and get from upper(yes)
	 the upper hierarchy components can be accessed by using(uvm_root::get)?how it can access


	 ------------Resorce db-----------------
	 it is 2 dimensional associative array  which is accessible for globally for setting and getting the variable
	 one dimension is :scope 
	 2nd dimenision is :key
	  setting syntax:
	  uvm_resource_db #(data_type)::set("scope","key",value,accessor)

	  retrieval of resorce can be done in two types
	  READ BY NAME
	  READ BY TYPE
	   
	 READ BY NAME: uvm_resource_db #(data_type)::read_by_name("scope","key",value,accessor)

	READ BY TYPE: uvm_resource_db #(data_type)::read_by_type("scope",value,accessor)
	Note:in type there is no key 




