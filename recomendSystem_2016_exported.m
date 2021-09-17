classdef recomendSystem_2016_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        ResearchRecomenderUIFigure      matlab.ui.Figure
        Precentages                     matlab.ui.control.TextArea
        Button_22                       matlab.ui.control.Button
        Button_21                       matlab.ui.control.Button
        Button_20                       matlab.ui.control.Button
        Button_19                       matlab.ui.control.Button
        Button_18                       matlab.ui.control.Button
        Button_17                       matlab.ui.control.Button
        Button_16                       matlab.ui.control.Button
        Button_15                       matlab.ui.control.Button
        Button_14                       matlab.ui.control.Button
        RecomendationsTextArea          matlab.ui.control.TextArea
        RecomendationsTextAreaLabel     matlab.ui.control.Label
        Button_13                       matlab.ui.control.Button
        ResearchRecomenderLabel_2       matlab.ui.control.Label
        Button_12                       matlab.ui.control.Button
        CC                              matlab.ui.control.CheckBox
        CloudComputingLabel             matlab.ui.control.Label
        DevopsSpinnerLabel              matlab.ui.control.Label
        DevopsSpinner                   matlab.ui.control.Spinner
        SignalProcessingSpinnerLabel    matlab.ui.control.Label
        SignalProcessingSpinner         matlab.ui.control.Spinner
        ImageProcessingSpinnerLabel     matlab.ui.control.Label
        ImageProcessingSpinner          matlab.ui.control.Spinner
        IP                              matlab.ui.control.CheckBox
        ImageProcessingLabel            matlab.ui.control.Label
        HPEP                            matlab.ui.control.CheckBox
        HeterogeneousPipelinesinEmbeddedProcessorsLabel  matlab.ui.control.Label
        InterestsLabel_2                matlab.ui.control.Label
        ResearchAreasLabel              matlab.ui.control.Label
        MachineLearningSpinner          matlab.ui.control.Spinner
        MachineLearningSpinnerLabel     matlab.ui.control.Label
        HighLevelProgrammingSpinnerLabel  matlab.ui.control.Label
        HighLevelProgrammingSpinner     matlab.ui.control.Spinner
        ComputerArchitectureSpinner     matlab.ui.control.Spinner
        LowLevelProgrammingSpinner      matlab.ui.control.Spinner
        LowLevelProgrammingSpinnerLabel  matlab.ui.control.Label
        CNWC                            matlab.ui.control.CheckBox
        ComputerArchitectureSpinnerLabel  matlab.ui.control.Label
        EmbeddedSystemSpinner           matlab.ui.control.Spinner
        EmbeddedSystemSpinnerLabel      matlab.ui.control.Label
        NetworkingSpinner               matlab.ui.control.Spinner
        NetworkingSpinnerLabel          matlab.ui.control.Label
        SecuritySpinner                 matlab.ui.control.Spinner
        SecuritySpinnerLabel            matlab.ui.control.Label
        Button                          matlab.ui.control.Button
        IoT                             matlab.ui.control.CheckBox
        MLBD                            matlab.ui.control.CheckBox
        ASRS                            matlab.ui.control.CheckBox
        SMES                            matlab.ui.control.CheckBox
        IoTLabel                        matlab.ui.control.Label
        MachineLearningandBigDataLabel  matlab.ui.control.Label
        ArchitecturalSupportforReliabilityandSecurityLabel  matlab.ui.control.Label
        SecureMicrokernelsforEmbeddedSystemsLabel  matlab.ui.control.Label
        ComputerNetworkingandWirelessCommunicationLabel  matlab.ui.control.Label
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: Button
        function ButtonPushed(app, event)
            
            
            fis = readfis('mid');
            
            available = [];
            interests = zeros(1,10);
            
            if(app.CNWC.Value == true)
                available(end+1,1) = 1;
            end              
            if(app.SMES.Value == true)
                available(end+1,1) = 2;
            end
            if(app.ASRS.Value == true)
                available(end+1,1) = 3;
            end
            if(app.MLBD.Value == true)
                available(end+1,1) = 4;
            end
            if(app.IoT.Value == true)
                available(end+1,1) = 5;
            end
            if(app.HPEP.Value == true)
                available(end+1,1) = 6;
            end
            if(app.IP.Value == true)
                available(end+1,1) = 7;
            end
            if(app.CC.Value == true)
                available(end+1,1) = 8;
            end
            
            topics = ["Computer Networking and Wireless Communication", "Secure microkernels for embedded systems", "Architectural support for Reliability and Security", "Machine Learning and Big Data", "IoT", "Heterogeneous Pipelines in Embedded Processors", "Image Processing", "Cloud Computing"];                  
            
            interests(1) = app.SecuritySpinner.Value;
            interests(2) = app.NetworkingSpinner.Value;
            interests(3) = app.EmbeddedSystemSpinner.Value;
            interests(4) = app.LowLevelProgrammingSpinner.Value;
            interests(5) = app.ComputerArchitectureSpinner.Value;
            interests(6) = app.MachineLearningSpinner.Value;
            interests(7) = app.HighLevelProgrammingSpinner.Value;
            interests(8) = app.ImageProcessingSpinner.Value;
            interests(9) = app.SignalProcessingSpinner.Value;
            interests(10) = app.DevopsSpinner.Value;
           
            out = evalfis(interests,fis) * 10;
            outAvailable = '';
            topicsAvailable = '';
         
            for r = 1:length(available)
                k = available(r);
                
                outAvailable = strcat(outAvailable, sprintf('%.2f',out(k)), '%',  {newline}, {newline});
                topicsAvailable = strcat(topicsAvailable, topics(k),  {newline}, {newline});           
  
            end
            
            
            
            app.RecomendationsTextArea.Value = topicsAvailable;
            app.Precentages.Value = outAvailable;
          
             
            
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create ResearchRecomenderUIFigure and hide until all components are created
            app.ResearchRecomenderUIFigure = uifigure('Visible', 'off');
            app.ResearchRecomenderUIFigure.AutoResizeChildren = 'off';
            app.ResearchRecomenderUIFigure.Color = [1 1 1];
            app.ResearchRecomenderUIFigure.Position = [100 100 1352 936];
            app.ResearchRecomenderUIFigure.Name = 'Research Recomender';
            app.ResearchRecomenderUIFigure.Resize = 'off';

            % Create ComputerNetworkingandWirelessCommunicationLabel
            app.ComputerNetworkingandWirelessCommunicationLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.ComputerNetworkingandWirelessCommunicationLabel.FontSize = 20;
            app.ComputerNetworkingandWirelessCommunicationLabel.FontWeight = 'bold';
            app.ComputerNetworkingandWirelessCommunicationLabel.Position = [43 718 510 35];
            app.ComputerNetworkingandWirelessCommunicationLabel.Text = 'Computer Networking and Wireless Communication';

            % Create SecureMicrokernelsforEmbeddedSystemsLabel
            app.SecureMicrokernelsforEmbeddedSystemsLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.SecureMicrokernelsforEmbeddedSystemsLabel.Tag = 'SMES';
            app.SecureMicrokernelsforEmbeddedSystemsLabel.FontSize = 20;
            app.SecureMicrokernelsforEmbeddedSystemsLabel.FontWeight = 'bold';
            app.SecureMicrokernelsforEmbeddedSystemsLabel.Position = [43 684 437 35];
            app.SecureMicrokernelsforEmbeddedSystemsLabel.Text = 'Secure Microkernels for Embedded Systems';

            % Create ArchitecturalSupportforReliabilityandSecurityLabel
            app.ArchitecturalSupportforReliabilityandSecurityLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.ArchitecturalSupportforReliabilityandSecurityLabel.Tag = 'ASRS';
            app.ArchitecturalSupportforReliabilityandSecurityLabel.FontSize = 20;
            app.ArchitecturalSupportforReliabilityandSecurityLabel.FontWeight = 'bold';
            app.ArchitecturalSupportforReliabilityandSecurityLabel.Position = [43 650 478 35];
            app.ArchitecturalSupportforReliabilityandSecurityLabel.Text = 'Architectural Support for Reliability and Security';

            % Create MachineLearningandBigDataLabel
            app.MachineLearningandBigDataLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.MachineLearningandBigDataLabel.Tag = 'MLBD';
            app.MachineLearningandBigDataLabel.FontSize = 20;
            app.MachineLearningandBigDataLabel.FontWeight = 'bold';
            app.MachineLearningandBigDataLabel.Position = [43 616 307 35];
            app.MachineLearningandBigDataLabel.Text = 'Machine Learning and Big Data';

            % Create IoTLabel
            app.IoTLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.IoTLabel.Tag = 'IoT';
            app.IoTLabel.FontSize = 20;
            app.IoTLabel.FontWeight = 'bold';
            app.IoTLabel.Position = [43 582 500 35];
            app.IoTLabel.Text = 'IoT';

            % Create SMES
            app.SMES = uicheckbox(app.ResearchRecomenderUIFigure);
            app.SMES.Text = '';
            app.SMES.Position = [556 690 25 22];
            app.SMES.Value = true;

            % Create ASRS
            app.ASRS = uicheckbox(app.ResearchRecomenderUIFigure);
            app.ASRS.Text = '';
            app.ASRS.Position = [556 656 25 22];
            app.ASRS.Value = true;

            % Create MLBD
            app.MLBD = uicheckbox(app.ResearchRecomenderUIFigure);
            app.MLBD.Text = '';
            app.MLBD.Position = [556 622 25 22];
            app.MLBD.Value = true;

            % Create IoT
            app.IoT = uicheckbox(app.ResearchRecomenderUIFigure);
            app.IoT.Text = '';
            app.IoT.Position = [556 588 25 22];
            app.IoT.Value = true;

            % Create Button
            app.Button = uibutton(app.ResearchRecomenderUIFigure, 'push');
            app.Button.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button.Icon = 'submitButton.png';
            app.Button.IconAlignment = 'center';
            app.Button.BackgroundColor = [1 1 1];
            app.Button.Position = [1052 309 193 50];
            app.Button.Text = '';

            % Create SecuritySpinnerLabel
            app.SecuritySpinnerLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.SecuritySpinnerLabel.HorizontalAlignment = 'right';
            app.SecuritySpinnerLabel.FontSize = 20;
            app.SecuritySpinnerLabel.FontWeight = 'bold';
            app.SecuritySpinnerLabel.Position = [965 723 84 24];
            app.SecuritySpinnerLabel.Text = 'Security';

            % Create SecuritySpinner
            app.SecuritySpinner = uispinner(app.ResearchRecomenderUIFigure);
            app.SecuritySpinner.Limits = [0 5];
            app.SecuritySpinner.Position = [1229 724 100 22];

            % Create NetworkingSpinnerLabel
            app.NetworkingSpinnerLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.NetworkingSpinnerLabel.HorizontalAlignment = 'right';
            app.NetworkingSpinnerLabel.FontSize = 20;
            app.NetworkingSpinnerLabel.FontWeight = 'bold';
            app.NetworkingSpinnerLabel.Position = [965 689 114 24];
            app.NetworkingSpinnerLabel.Text = 'Networking';

            % Create NetworkingSpinner
            app.NetworkingSpinner = uispinner(app.ResearchRecomenderUIFigure);
            app.NetworkingSpinner.Limits = [0 5];
            app.NetworkingSpinner.Position = [1229 690 99 22];

            % Create EmbeddedSystemSpinnerLabel
            app.EmbeddedSystemSpinnerLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.EmbeddedSystemSpinnerLabel.HorizontalAlignment = 'right';
            app.EmbeddedSystemSpinnerLabel.FontSize = 20;
            app.EmbeddedSystemSpinnerLabel.FontWeight = 'bold';
            app.EmbeddedSystemSpinnerLabel.Position = [966 656 184 24];
            app.EmbeddedSystemSpinnerLabel.Text = 'Embedded System';

            % Create EmbeddedSystemSpinner
            app.EmbeddedSystemSpinner = uispinner(app.ResearchRecomenderUIFigure);
            app.EmbeddedSystemSpinner.Limits = [0 5];
            app.EmbeddedSystemSpinner.Position = [1229 657 100 22];

            % Create ComputerArchitectureSpinnerLabel
            app.ComputerArchitectureSpinnerLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.ComputerArchitectureSpinnerLabel.HorizontalAlignment = 'right';
            app.ComputerArchitectureSpinnerLabel.FontSize = 20;
            app.ComputerArchitectureSpinnerLabel.FontWeight = 'bold';
            app.ComputerArchitectureSpinnerLabel.Position = [965 587 225 24];
            app.ComputerArchitectureSpinnerLabel.Text = 'Computer Architecture';

            % Create CNWC
            app.CNWC = uicheckbox(app.ResearchRecomenderUIFigure);
            app.CNWC.Tag = 'CNWC';
            app.CNWC.Text = '';
            app.CNWC.Position = [556 724 25 22];
            app.CNWC.Value = true;

            % Create LowLevelProgrammingSpinnerLabel
            app.LowLevelProgrammingSpinnerLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.LowLevelProgrammingSpinnerLabel.HorizontalAlignment = 'right';
            app.LowLevelProgrammingSpinnerLabel.FontSize = 20;
            app.LowLevelProgrammingSpinnerLabel.FontWeight = 'bold';
            app.LowLevelProgrammingSpinnerLabel.Position = [965 622 240 24];
            app.LowLevelProgrammingSpinnerLabel.Text = 'Low Level Programming';

            % Create LowLevelProgrammingSpinner
            app.LowLevelProgrammingSpinner = uispinner(app.ResearchRecomenderUIFigure);
            app.LowLevelProgrammingSpinner.Limits = [0 5];
            app.LowLevelProgrammingSpinner.Position = [1231 623 97 22];

            % Create ComputerArchitectureSpinner
            app.ComputerArchitectureSpinner = uispinner(app.ResearchRecomenderUIFigure);
            app.ComputerArchitectureSpinner.Limits = [0 5];
            app.ComputerArchitectureSpinner.Position = [1230 591 100 22];

            % Create HighLevelProgrammingSpinner
            app.HighLevelProgrammingSpinner = uispinner(app.ResearchRecomenderUIFigure);
            app.HighLevelProgrammingSpinner.Limits = [0 5];
            app.HighLevelProgrammingSpinner.Position = [1231 522 100 22];

            % Create HighLevelProgrammingSpinnerLabel
            app.HighLevelProgrammingSpinnerLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.HighLevelProgrammingSpinnerLabel.HorizontalAlignment = 'right';
            app.HighLevelProgrammingSpinnerLabel.FontSize = 20;
            app.HighLevelProgrammingSpinnerLabel.FontWeight = 'bold';
            app.HighLevelProgrammingSpinnerLabel.Position = [965 521 244 24];
            app.HighLevelProgrammingSpinnerLabel.Text = 'High Level Programming';

            % Create MachineLearningSpinnerLabel
            app.MachineLearningSpinnerLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.MachineLearningSpinnerLabel.HorizontalAlignment = 'right';
            app.MachineLearningSpinnerLabel.FontSize = 20;
            app.MachineLearningSpinnerLabel.FontWeight = 'bold';
            app.MachineLearningSpinnerLabel.Position = [965 556 176 24];
            app.MachineLearningSpinnerLabel.Text = 'Machine Learning';

            % Create MachineLearningSpinner
            app.MachineLearningSpinner = uispinner(app.ResearchRecomenderUIFigure);
            app.MachineLearningSpinner.Limits = [0 5];
            app.MachineLearningSpinner.Position = [1231 557 98 22];

            % Create ResearchAreasLabel
            app.ResearchAreasLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.ResearchAreasLabel.FontSize = 30;
            app.ResearchAreasLabel.FontWeight = 'bold';
            app.ResearchAreasLabel.Position = [43 779 233 36];
            app.ResearchAreasLabel.Text = 'Research Areas';

            % Create InterestsLabel_2
            app.InterestsLabel_2 = uilabel(app.ResearchRecomenderUIFigure);
            app.InterestsLabel_2.FontSize = 30;
            app.InterestsLabel_2.FontWeight = 'bold';
            app.InterestsLabel_2.Position = [930 779 255 36];
            app.InterestsLabel_2.Text = 'Interests';

            % Create HeterogeneousPipelinesinEmbeddedProcessorsLabel
            app.HeterogeneousPipelinesinEmbeddedProcessorsLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.HeterogeneousPipelinesinEmbeddedProcessorsLabel.Tag = 'HPEP';
            app.HeterogeneousPipelinesinEmbeddedProcessorsLabel.FontSize = 20;
            app.HeterogeneousPipelinesinEmbeddedProcessorsLabel.FontWeight = 'bold';
            app.HeterogeneousPipelinesinEmbeddedProcessorsLabel.Position = [43 548 500 35];
            app.HeterogeneousPipelinesinEmbeddedProcessorsLabel.Text = 'Heterogeneous Pipelines in Embedded Processors';

            % Create HPEP
            app.HPEP = uicheckbox(app.ResearchRecomenderUIFigure);
            app.HPEP.Text = '';
            app.HPEP.Position = [556 554 25 22];
            app.HPEP.Value = true;

            % Create ImageProcessingLabel
            app.ImageProcessingLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.ImageProcessingLabel.Tag = 'IP';
            app.ImageProcessingLabel.FontSize = 20;
            app.ImageProcessingLabel.FontWeight = 'bold';
            app.ImageProcessingLabel.Position = [43 512 177 35];
            app.ImageProcessingLabel.Text = 'Image Processing';

            % Create IP
            app.IP = uicheckbox(app.ResearchRecomenderUIFigure);
            app.IP.Text = '';
            app.IP.Position = [556 518 25 22];
            app.IP.Value = true;

            % Create ImageProcessingSpinner
            app.ImageProcessingSpinner = uispinner(app.ResearchRecomenderUIFigure);
            app.ImageProcessingSpinner.Limits = [0 5];
            app.ImageProcessingSpinner.Position = [1231 483 99 22];

            % Create ImageProcessingSpinnerLabel
            app.ImageProcessingSpinnerLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.ImageProcessingSpinnerLabel.HorizontalAlignment = 'right';
            app.ImageProcessingSpinnerLabel.FontSize = 20;
            app.ImageProcessingSpinnerLabel.FontWeight = 'bold';
            app.ImageProcessingSpinnerLabel.Position = [966 482 177 24];
            app.ImageProcessingSpinnerLabel.Text = 'Image Processing';

            % Create SignalProcessingSpinner
            app.SignalProcessingSpinner = uispinner(app.ResearchRecomenderUIFigure);
            app.SignalProcessingSpinner.Limits = [0 5];
            app.SignalProcessingSpinner.Position = [1231 442 101 22];

            % Create SignalProcessingSpinnerLabel
            app.SignalProcessingSpinnerLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.SignalProcessingSpinnerLabel.HorizontalAlignment = 'right';
            app.SignalProcessingSpinnerLabel.FontSize = 20;
            app.SignalProcessingSpinnerLabel.FontWeight = 'bold';
            app.SignalProcessingSpinnerLabel.Position = [966 441 179 24];
            app.SignalProcessingSpinnerLabel.Text = 'Signal Processing';

            % Create DevopsSpinner
            app.DevopsSpinner = uispinner(app.ResearchRecomenderUIFigure);
            app.DevopsSpinner.Limits = [0 5];
            app.DevopsSpinner.Position = [1231 401 101 22];

            % Create DevopsSpinnerLabel
            app.DevopsSpinnerLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.DevopsSpinnerLabel.HorizontalAlignment = 'right';
            app.DevopsSpinnerLabel.FontSize = 20;
            app.DevopsSpinnerLabel.FontWeight = 'bold';
            app.DevopsSpinnerLabel.Position = [966 400 78 24];
            app.DevopsSpinnerLabel.Text = 'Devops';

            % Create CloudComputingLabel
            app.CloudComputingLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.CloudComputingLabel.Tag = 'CC';
            app.CloudComputingLabel.FontSize = 20;
            app.CloudComputingLabel.FontWeight = 'bold';
            app.CloudComputingLabel.Position = [43 476 177 35];
            app.CloudComputingLabel.Text = 'Cloud Computing';

            % Create CC
            app.CC = uicheckbox(app.ResearchRecomenderUIFigure);
            app.CC.Text = '';
            app.CC.Position = [556 482 25 22];
            app.CC.Value = true;

            % Create Button_12
            app.Button_12 = uibutton(app.ResearchRecomenderUIFigure, 'push');
            app.Button_12.Interruptible = 'off';
            app.Button_12.Icon = 'header.jpg';
            app.Button_12.IconAlignment = 'center';
            app.Button_12.BackgroundColor = [0.149 0.149 0.149];
            app.Button_12.FontSize = 20;
            app.Button_12.Position = [1 840 1352 97];
            app.Button_12.Text = '';

            % Create ResearchRecomenderLabel_2
            app.ResearchRecomenderLabel_2 = uilabel(app.ResearchRecomenderUIFigure);
            app.ResearchRecomenderLabel_2.FontSize = 50;
            app.ResearchRecomenderLabel_2.FontWeight = 'bold';
            app.ResearchRecomenderLabel_2.FontColor = [1 1 1];
            app.ResearchRecomenderLabel_2.Position = [43 864 558 62];
            app.ResearchRecomenderLabel_2.Text = 'Research Recomender';

            % Create Button_13
            app.Button_13 = uibutton(app.ResearchRecomenderUIFigure, 'push');
            app.Button_13.Interruptible = 'off';
            app.Button_13.Icon = 'security.png';
            app.Button_13.BackgroundColor = [1 1 1];
            app.Button_13.Position = [919 718 33 28];
            app.Button_13.Text = '';

            % Create RecomendationsTextAreaLabel
            app.RecomendationsTextAreaLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.RecomendationsTextAreaLabel.BackgroundColor = [1 1 1];
            app.RecomendationsTextAreaLabel.HorizontalAlignment = 'right';
            app.RecomendationsTextAreaLabel.FontSize = 20;
            app.RecomendationsTextAreaLabel.FontWeight = 'bold';
            app.RecomendationsTextAreaLabel.Position = [35 416 167 24];
            app.RecomendationsTextAreaLabel.Text = 'Recomendations';

            % Create RecomendationsTextArea
            app.RecomendationsTextArea = uitextarea(app.ResearchRecomenderUIFigure);
            app.RecomendationsTextArea.Editable = 'off';
            app.RecomendationsTextArea.FontSize = 20;
            app.RecomendationsTextArea.Position = [212 38 516 402];

            % Create Button_14
            app.Button_14 = uibutton(app.ResearchRecomenderUIFigure, 'push');
            app.Button_14.Interruptible = 'off';
            app.Button_14.Icon = 'networking.png';
            app.Button_14.BackgroundColor = [1 1 1];
            app.Button_14.Position = [919 687 33 28];
            app.Button_14.Text = '';

            % Create Button_15
            app.Button_15 = uibutton(app.ResearchRecomenderUIFigure, 'push');
            app.Button_15.Interruptible = 'off';
            app.Button_15.Icon = 'embeded.png';
            app.Button_15.BackgroundColor = [1 1 1];
            app.Button_15.Position = [919 654 33 28];
            app.Button_15.Text = '';

            % Create Button_16
            app.Button_16 = uibutton(app.ResearchRecomenderUIFigure, 'push');
            app.Button_16.Interruptible = 'off';
            app.Button_16.Icon = 'programing.png';
            app.Button_16.BackgroundColor = [1 1 1];
            app.Button_16.Position = [919 619 33 28];
            app.Button_16.Text = '';

            % Create Button_17
            app.Button_17 = uibutton(app.ResearchRecomenderUIFigure, 'push');
            app.Button_17.Interruptible = 'off';
            app.Button_17.Icon = 'architecture.png';
            app.Button_17.BackgroundColor = [1 1 1];
            app.Button_17.Position = [919 586 33 28];
            app.Button_17.Text = '';

            % Create Button_18
            app.Button_18 = uibutton(app.ResearchRecomenderUIFigure, 'push');
            app.Button_18.Interruptible = 'off';
            app.Button_18.Icon = 'ml.png';
            app.Button_18.BackgroundColor = [1 1 1];
            app.Button_18.Position = [919 554 33 28];
            app.Button_18.Text = '';

            % Create Button_19
            app.Button_19 = uibutton(app.ResearchRecomenderUIFigure, 'push');
            app.Button_19.Interruptible = 'off';
            app.Button_19.Icon = 'coding.png';
            app.Button_19.BackgroundColor = [1 1 1];
            app.Button_19.Position = [919 518 33 28];
            app.Button_19.Text = '';

            % Create Button_20
            app.Button_20 = uibutton(app.ResearchRecomenderUIFigure, 'push');
            app.Button_20.Interruptible = 'off';
            app.Button_20.Icon = 'imageprocessing.png';
            app.Button_20.BackgroundColor = [1 1 1];
            app.Button_20.Position = [919 480 33 28];
            app.Button_20.Text = '';

            % Create Button_21
            app.Button_21 = uibutton(app.ResearchRecomenderUIFigure, 'push');
            app.Button_21.Interruptible = 'off';
            app.Button_21.Icon = 'signal.png';
            app.Button_21.BackgroundColor = [1 1 1];
            app.Button_21.Position = [919 439 33 28];
            app.Button_21.Text = '';

            % Create Button_22
            app.Button_22 = uibutton(app.ResearchRecomenderUIFigure, 'push');
            app.Button_22.Interruptible = 'off';
            app.Button_22.Icon = 'devops.png';
            app.Button_22.BackgroundColor = [1 1 1];
            app.Button_22.Position = [919 401 33 28];
            app.Button_22.Text = '';

            % Create Precentages
            app.Precentages = uitextarea(app.ResearchRecomenderUIFigure);
            app.Precentages.HorizontalAlignment = 'center';
            app.Precentages.FontSize = 20;
            app.Precentages.BackgroundColor = [0.9412 0.9412 0.9412];
            app.Precentages.Position = [763 38 100 402];

            % Show the figure after all components are created
            app.ResearchRecomenderUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = recomendSystem_2016_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.ResearchRecomenderUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.ResearchRecomenderUIFigure)
        end
    end
end