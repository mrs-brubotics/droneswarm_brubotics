%% This section is not working anymore for ctu msgs...
% clear
% clc
% folderpath = '/home/nuc1/mrs_workspace/src/uav_core/ros_packages'; % change to home/devicename
% %folderpath = '/home/nuc1/git/uav_core/.gitman/mrs_msgs/msg/'; % change to home/devicename
% rosgenmsg(folderpath) % this might take while
% % run, wait several minutes, and follow the 3 steps below

%% CTU MRS & Brubotics
clear
clc
% go manually to the matlab path (browse for folder):
% /home/devicename/mrs_workspace/src/uav_core/ros_packages/mrs_msgs/msg/
% OR %cd /home/nuc1/mrs_workspace/src/uav_core/ros_packages/mrs_msgs/msg/
% OR automatically
msg_folder_ctu = '~/mrs_workspace/src/uav_core/ros_packages/mrs_msgs/msg/';
srv_folder_ctu = '~/mrs_workspace/src/uav_core/ros_packages/mrs_msgs/srv/';
destination_folder_brubotics = '~/workspace/src/droneswarm_brubotics/ros_packages';
% delete "mrs_msgs" folder and subfolders in destination path if they already exist
cd(destination_folder_brubotics)
try
    rmdir mrs_msgs s 
    disp(['Deleted "mrs_msgs" folder and subfolders in destination path, ', destination_folder_brubotics])
catch
    warning('mrs_msgs does not exist and can not be deleted');
end

% create a new mrs_msgs folder
mkdir mrs_msgs;
destination_folder_brubotics = '~/workspace/src/droneswarm_brubotics/ros_packages/mrs_msgs';
cd(destination_folder_brubotics);
mkdir msg;
mkdir srv;

% copy msg from msg_folder_ctu and srv files from srv_folder_ctu to '~/workspace/src/droneswarm_brubotics/ros_packages/mrs_msgs'
for k = 1:2 % msg and srv
    if k == 1
        msg_or_srv_folder_ctu = msg_folder_ctu;
        str_msg_or_srv = 'msg';
    elseif k == 2
        msg_or_srv_folder_ctu = srv_folder_ctu;
        str_msg_or_srv = 'srv';
    end
    disp('--------------------------------------------------------------------');
    disp(['Starting with: .',str_msg_or_srv]);
    % disp(' ');
    cd(msg_or_srv_folder_ctu)
    destination_folder_brubotics_msg_or_srv = strcat(destination_folder_brubotics,'/',str_msg_or_srv);
    dir_here = dir;
    num_fields_dir_here = size(dir_here,1);
    % [TODO] !!!!!if some .msg or .srv files are not inside subfolders but directly in this fodler, copy them already fileList = dir('*.msg');
    for i=1:num_fields_dir_here
        str_local_folder = strcat(dir_here(i).folder,'/',dir_here(i).name);
        %disp(str_local_folder);
        try
            cd(str_local_folder)
        catch ME
            warning(ME.message); % a file is not a folder so cannot cd
            disp('a file is not a folder so cannot cd')
            continue % go to next iteration in for loop
        end
        % we assume no deeper than 1 subfolder are .msg or .srv files
        dir_local_folder = dir(strcat('*.',str_msg_or_srv));
        num_fields_dir_local_folder = size(dir_local_folder,1);
        if num_fields_dir_local_folder >= 1
            [status,msg] = copyfile(strcat('*.',str_msg_or_srv),destination_folder_brubotics_msg_or_srv);
            if status == 1
                str_num_fields_dir_local_folder = num2str(num_fields_dir_local_folder);
                str =['Subfolder ',num2str(i),' : copied ',str_num_fields_dir_local_folder ,' .', str_msg_or_srv,' files from ',str_local_folder,' to ',destination_folder_brubotics_msg_or_srv,'.'];
                disp(str)
            else
                warning(msg)
            end  
        else
           str =['Subfolder ',num2str(i),': no .', str_msg_or_srv,' files to copy from this folder.'];
                disp(str) 
        end
        %disp(' ');
        if i == num_fields_dir_here
            disp(['Finished with: .',str_msg_or_srv]);
            disp('--------------------------------------------------------------------');
            cd(msg_folder_ctu)
        end
    end
    disp(' ');
end
%% rosgenmsg of ctu and brubotics .msg and .srv
destination_folder_brubotics = '~/workspace/src/droneswarm_brubotics/ros_packages';
cd(destination_folder_brubotics);
rosgenmsg(destination_folder_brubotics) % this might take a while (5-10 minutes)!
cd('~/workspace/src/droneswarm_brubotics/useful_files/matlab')
%% [MANUAL] run script, let it copy the .msg and .srv, wait several minutes for rosgenmsg to finish, and follow the 3 steps printed below
% search for trackers_brubotics/DSM                                         
% trackers_brubotics/FutureTrajectoryTube 
% mrs_msgs/ ...