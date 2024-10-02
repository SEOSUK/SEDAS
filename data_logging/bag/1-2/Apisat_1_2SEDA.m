% timescale 맞추기 귀차나서 변수선언 ㅋㅋㅋ 웃냐
XLIM_min = 39;
XLIM_max = 44;


bag = rosbag("1stSEDA_2024-07-26-13-17-04.bag");

bag_data_log_1_2SEDA                 =select(bag,'Topic','/inch/data_log');
data_log_time_1_2SEDA                =timeseries(bag_data_log_1_2SEDA);
data_log_msgs_1_2SEDA                =readMessages(bag_data_log_1_2SEDA);
time_origin_1_2SEDA                  =data_log_time_1_2SEDA.Time(1);
data_log_msgs_size_1_2SEDA           =size(data_log_msgs_1_2SEDA);


% Palletrone Data 
inchBase_position_1_2SEDA             =zeros(data_log_msgs_size_1_2SEDA(1),3); % OpitTrack Info
inchBase_attitude_1_2SEDA             =zeros(data_log_msgs_size_1_2SEDA(1),3); % OpitTrack Info

% Inchworm Data
global_EE_ref_1_2SEDA                 =zeros(data_log_msgs_size_1_2SEDA(1),2); % OpitTrack Info
global_EE_cmd_1_2SEDA                 =zeros(data_log_msgs_size_1_2SEDA(1),2); % OpitTrack Info
global_EE_meas_1_2SEDA                =zeros(data_log_msgs_size_1_2SEDA(1),2); % OpitTrack Info
EE_ref_1_2SEDA                        =zeros(data_log_msgs_size_1_2SEDA(1),2);
EE_cmd_1_2SEDA                        =zeros(data_log_msgs_size_1_2SEDA(1),2);
EE_meas_1_2SEDA                       =zeros(data_log_msgs_size_1_2SEDA(1),2);
F_ext_1_2SEDA                         =zeros(data_log_msgs_size_1_2SEDA(1),2);
F_ext_raw_1_2SEDA                     =zeros(data_log_msgs_size_1_2SEDA(1),2);
q_ref_1_2SEDA                         =zeros(data_log_msgs_size_1_2SEDA(1),2);
q_meas_1_2SEDA                        =zeros(data_log_msgs_size_1_2SEDA(1),2);
phi_meas_1_2SEDA                      =zeros(data_log_msgs_size_1_2SEDA(1),2);
theta_cmd_1_2SEDA                     =zeros(data_log_msgs_size_1_2SEDA(1),2);
tau_ext_1_2SEDA                       =zeros(data_log_msgs_size_1_2SEDA(1),2);


% Data 뽀개기  
for i=1:data_log_msgs_size_1_2SEDA(1)
    global_EE_ref_1_2SEDA(i,1)        =data_log_msgs_1_2SEDA{i,1}.Data(1);
    global_EE_ref_1_2SEDA(i,2)        =data_log_msgs_1_2SEDA{i,1}.Data(2); 
    global_EE_cmd_1_2SEDA(i,1)        =data_log_msgs_1_2SEDA{i,1}.Data(3);
    global_EE_cmd_1_2SEDA(i,2)        =data_log_msgs_1_2SEDA{i,1}.Data(4);
    global_EE_meas_1_2SEDA(i,1)       =data_log_msgs_1_2SEDA{i,1}.Data(5); 
    global_EE_meas_1_2SEDA(i,2)       =data_log_msgs_1_2SEDA{i,1}.Data(6);

    EE_ref_1_2SEDA(i,1)               =data_log_msgs_1_2SEDA{i,1}.Data(7);
    EE_ref_1_2SEDA(i,2)               =data_log_msgs_1_2SEDA{i,1}.Data(8);
    EE_cmd_1_2SEDA(i,1)               =data_log_msgs_1_2SEDA{i,1}.Data(9);
    EE_cmd_1_2SEDA(i,2)               =data_log_msgs_1_2SEDA{i,1}.Data(10);
    EE_meas_1_2SEDA(i,1)              =data_log_msgs_1_2SEDA{i,1}.Data(11);
    EE_meas_1_2SEDA(i,2)              =data_log_msgs_1_2SEDA{i,1}.Data(12);
    
    F_ext_1_2SEDA(i,1)                =data_log_msgs_1_2SEDA{i,1}.Data(13);
    F_ext_1_2SEDA(i,2)                =data_log_msgs_1_2SEDA{i,1}.Data(14);
    F_ext_raw_1_2SEDA(i,1)            =data_log_msgs_1_2SEDA{i,1}.Data(15);
    F_ext_raw_1_2SEDA(i,2)            =data_log_msgs_1_2SEDA{i,1}.Data(16);
    
    q_ref_1_2SEDA(i,1)                =data_log_msgs_1_2SEDA{i,1}.Data(17);
    q_ref_1_2SEDA(i,2)                =data_log_msgs_1_2SEDA{i,1}.Data(18);
    q_meas_1_2SEDA(i,1)               =data_log_msgs_1_2SEDA{i,1}.Data(19);
    q_meas_1_2SEDA(i,2)               =data_log_msgs_1_2SEDA{i,1}.Data(20);

    inchBase_position_1_2SEDA(i,1)    =data_log_msgs_1_2SEDA{i,1}.Data(21);
    inchBase_position_1_2SEDA(i,2)    =data_log_msgs_1_2SEDA{i,1}.Data(22);
    inchBase_position_1_2SEDA(i,3)    =data_log_msgs_1_2SEDA{i,1}.Data(23);
    inchBase_attitude_1_2SEDA(i,1)    =data_log_msgs_1_2SEDA{i,1}.Data(24);
    inchBase_attitude_1_2SEDA(i,2)    =data_log_msgs_1_2SEDA{i,1}.Data(25);
    inchBase_attitude_1_2SEDA(i,3)    =data_log_msgs_1_2SEDA{i,1}.Data(26);

    phi_meas_1_2SEDA(i,1)               =data_log_msgs_1_2SEDA{i,1}.Data(27);
    phi_meas_1_2SEDA(i,2)               =data_log_msgs_1_2SEDA{i,1}.Data(28);
    theta_cmd_1_2SEDA(i,1)              =data_log_msgs_1_2SEDA{i,1}.Data(29);
    theta_cmd_1_2SEDA(i,2)              =data_log_msgs_1_2SEDA{i,1}.Data(30);
    tau_ext_1_2SEDA(i,1)                =data_log_msgs_1_2SEDA{i,1}.Data(31);
    tau_ext_1_2SEDA(i,2)                =data_log_msgs_1_2SEDA{i,1}.Data(32);

end

d1 = designfilt("lowpassiir",FilterOrder=12, ...
    HalfPowerFrequency=0.15,DesignMethod="butter");

global_EE_ref_1_2SEDA = filtfilt(d1,global_EE_ref_1_2SEDA);
global_EE_meas_1_2SEDA = filtfilt(d1,global_EE_meas_1_2SEDA);
inchBase_position_1_2SEDA = filtfilt(d1, inchBase_position_1_2SEDA);