classdef recomendSystem_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        ResearchRecomenderUIFigure      matlab.ui.Figure
        CheckBox_8                      matlab.ui.control.CheckBox
        CloudcomputingLabel             matlab.ui.control.Label
        ResearchRecomenderLabel         matlab.ui.control.Label
        DevopsSpinnerLabel              matlab.ui.control.Label
        DevopsSpinner                   matlab.ui.control.Spinner
        Image2_10                       matlab.ui.control.Image
        SignalProcessingSpinnerLabel    matlab.ui.control.Label
        SignalProcessingSpinner         matlab.ui.control.Spinner
        Image2_9                        matlab.ui.control.Image
        ImageProcessingSpinnerLabel     matlab.ui.control.Label
        ImageProcessingSpinner          matlab.ui.control.Spinner
        Image2_8                        matlab.ui.control.Image
        CheckBox_7                      matlab.ui.control.CheckBox
        ImageProcessingLabel            matlab.ui.control.Label
        CheckBox_6                      matlab.ui.control.CheckBox
        HeterogeneousPipelinesinEmbeddedProcessorsLabel  matlab.ui.control.Label
        Image2_7                        matlab.ui.control.Image
        Image2_6                        matlab.ui.control.Image
        Image2_5                        matlab.ui.control.Image
        Image2_4                        matlab.ui.control.Image
        Image2_3                        matlab.ui.control.Image
        Image2_2                        matlab.ui.control.Image
        Image2                          matlab.ui.control.Image
        InterestsLabel_2                matlab.ui.control.Label
        ResearchAreasLabel              matlab.ui.control.Label
        MachineLearningSpinner          matlab.ui.control.Spinner
        Image                           matlab.ui.control.Image
        MachineLearningSpinnerLabel     matlab.ui.control.Label
        HighLevelProgrammingSpinnerLabel  matlab.ui.control.Label
        HighLevelProgrammingSpinner     matlab.ui.control.Spinner
        ComputerArchitectureSpinner     matlab.ui.control.Spinner
        LowLevelProgrammingSpinner      matlab.ui.control.Spinner
        LowLevelProgrammingSpinnerLabel  matlab.ui.control.Label
        CheckBox_1                      matlab.ui.control.CheckBox
        ComputerArchitectureSpinnerLabel  matlab.ui.control.Label
        EmbeddedSystemSpinner           matlab.ui.control.Spinner
        EmbeddedSystemSpinnerLabel      matlab.ui.control.Label
        NetworkingSpinner               matlab.ui.control.Spinner
        NetworkingSpinnerLabel          matlab.ui.control.Label
        SecuritySpinner                 matlab.ui.control.Spinner
        SecuritySpinnerLabel            matlab.ui.control.Label
        Button                          matlab.ui.control.Button
        CheckBox_5                      matlab.ui.control.CheckBox
        CheckBox_4                      matlab.ui.control.CheckBox
        CheckBox_3                      matlab.ui.control.CheckBox
        CheckBox_2                      matlab.ui.control.CheckBox
        IoTLabel                        matlab.ui.control.Label
        MachineLearningandBigDataLabel  matlab.ui.control.Label
        ArchitecturalSupportforReliabilityandSecurityLabel  matlab.ui.control.Label
        SecureMicrokernelsforEmbeddedSystemsLabel  matlab.ui.control.Label
        ComputerNetworkingandWirelessCommunicationLabel  matlab.ui.control.Label
        UITable                         matlab.ui.control.Table
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: Button
        function ButtonPushed(app, event)
            
            
            fis = readfis('mid');
            
            available = [];
            interests = zeros(1,10);
            
            if(app.CheckBox_1.Value == true)
                available(end+1,1) = 1;
            end              
            if(app.CheckBox_2.Value == true)
                available(end+1,1) = 2;
            end
            if(app.CheckBox_3.Value == true)
                available(end+1,1) = 3;
            end
            if(app.CheckBox_4.Value == true)
                available(end+1,1) = 4;
            end
            if(app.CheckBox_5.Value == true)
                available(end+1,1) = 5;
            end
            if(app.CheckBox_6.Value == true)
                available(end+1,1) = 6;
            end
            if(app.CheckBox_7.Value == true)
                available(end+1,1) = 7;
            end
            if(app.CheckBox_8.Value == true)
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
            outAvailable = zeros(1,length(available));
            topicsAvailable = strings(1,length(available));
           
            for r = 1:length(available)
                k = available(r);
                outAvailable(r) = out(k);
                topicsAvailable(r) = topics(k);
            end

            res =  [topicsAvailable.' outAvailable.'];
            app.UITable.Data = res;
          
             
            
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
            app.ResearchRecomenderUIFigure.Position = [100 100 1199 741];
            app.ResearchRecomenderUIFigure.Name = 'Research Recomender';
            app.ResearchRecomenderUIFigure.Icon = 'App.png';
            app.ResearchRecomenderUIFigure.Resize = 'off';

            % Create UITable
            app.UITable = uitable(app.ResearchRecomenderUIFigure);
            app.UITable.ColumnName = {'Research Area'; 'Recomendation'};
            app.UITable.RowName = {};
            app.UITable.Position = [76 28 647 221];

            % Create ComputerNetworkingandWirelessCommunicationLabel
            app.ComputerNetworkingandWirelessCommunicationLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.ComputerNetworkingandWirelessCommunicationLabel.FontSize = 20;
            app.ComputerNetworkingandWirelessCommunicationLabel.FontWeight = 'bold';
            app.ComputerNetworkingandWirelessCommunicationLabel.Position = [75 523 510 35];
            app.ComputerNetworkingandWirelessCommunicationLabel.Text = 'Computer Networking and Wireless Communication';

            % Create SecureMicrokernelsforEmbeddedSystemsLabel
            app.SecureMicrokernelsforEmbeddedSystemsLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.SecureMicrokernelsforEmbeddedSystemsLabel.FontSize = 20;
            app.SecureMicrokernelsforEmbeddedSystemsLabel.FontWeight = 'bold';
            app.SecureMicrokernelsforEmbeddedSystemsLabel.Position = [75 489 437 35];
            app.SecureMicrokernelsforEmbeddedSystemsLabel.Text = 'Secure Microkernels for Embedded Systems';

            % Create ArchitecturalSupportforReliabilityandSecurityLabel
            app.ArchitecturalSupportforReliabilityandSecurityLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.ArchitecturalSupportforReliabilityandSecurityLabel.FontSize = 20;
            app.ArchitecturalSupportforReliabilityandSecurityLabel.FontWeight = 'bold';
            app.ArchitecturalSupportforReliabilityandSecurityLabel.Position = [75 455 478 35];
            app.ArchitecturalSupportforReliabilityandSecurityLabel.Text = 'Architectural Support for Reliability and Security';

            % Create MachineLearningandBigDataLabel
            app.MachineLearningandBigDataLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.MachineLearningandBigDataLabel.FontSize = 20;
            app.MachineLearningandBigDataLabel.FontWeight = 'bold';
            app.MachineLearningandBigDataLabel.Position = [75 421 307 35];
            app.MachineLearningandBigDataLabel.Text = 'Machine Learning and Big Data';

            % Create IoTLabel
            app.IoTLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.IoTLabel.FontSize = 20;
            app.IoTLabel.FontWeight = 'bold';
            app.IoTLabel.Position = [75 387 500 35];
            app.IoTLabel.Text = 'IoT';

            % Create CheckBox_2
            app.CheckBox_2 = uicheckbox(app.ResearchRecomenderUIFigure);
            app.CheckBox_2.Text = '';
            app.CheckBox_2.Position = [588 495 25 22];
            app.CheckBox_2.Value = true;

            % Create CheckBox_3
            app.CheckBox_3 = uicheckbox(app.ResearchRecomenderUIFigure);
            app.CheckBox_3.Text = '';
            app.CheckBox_3.Position = [588 461 25 22];
            app.CheckBox_3.Value = true;

            % Create CheckBox_4
            app.CheckBox_4 = uicheckbox(app.ResearchRecomenderUIFigure);
            app.CheckBox_4.Text = '';
            app.CheckBox_4.Position = [588 427 25 22];
            app.CheckBox_4.Value = true;

            % Create CheckBox_5
            app.CheckBox_5 = uicheckbox(app.ResearchRecomenderUIFigure);
            app.CheckBox_5.Text = '';
            app.CheckBox_5.Position = [588 393 25 22];
            app.CheckBox_5.Value = true;

            % Create Button
            app.Button = uibutton(app.ResearchRecomenderUIFigure, 'push');
            app.Button.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button.Icon = 'submitButton.png';
            app.Button.IconAlignment = 'center';
            app.Button.BackgroundColor = [1 1 1];
            app.Button.Position = [883 117 193 50];
            app.Button.Text = '';

            % Create SecuritySpinnerLabel
            app.SecuritySpinnerLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.SecuritySpinnerLabel.HorizontalAlignment = 'right';
            app.SecuritySpinnerLabel.FontSize = 20;
            app.SecuritySpinnerLabel.FontWeight = 'bold';
            app.SecuritySpinnerLabel.Position = [799 528 84 24];
            app.SecuritySpinnerLabel.Text = 'Security';

            % Create SecuritySpinner
            app.SecuritySpinner = uispinner(app.ResearchRecomenderUIFigure);
            app.SecuritySpinner.Limits = [0 5];
            app.SecuritySpinner.Position = [1063 529 100 22];

            % Create NetworkingSpinnerLabel
            app.NetworkingSpinnerLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.NetworkingSpinnerLabel.HorizontalAlignment = 'right';
            app.NetworkingSpinnerLabel.FontSize = 20;
            app.NetworkingSpinnerLabel.FontWeight = 'bold';
            app.NetworkingSpinnerLabel.Position = [799 494 114 24];
            app.NetworkingSpinnerLabel.Text = 'Networking';

            % Create NetworkingSpinner
            app.NetworkingSpinner = uispinner(app.ResearchRecomenderUIFigure);
            app.NetworkingSpinner.Limits = [0 5];
            app.NetworkingSpinner.Position = [1063 495 99 22];

            % Create EmbeddedSystemSpinnerLabel
            app.EmbeddedSystemSpinnerLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.EmbeddedSystemSpinnerLabel.HorizontalAlignment = 'right';
            app.EmbeddedSystemSpinnerLabel.FontSize = 20;
            app.EmbeddedSystemSpinnerLabel.FontWeight = 'bold';
            app.EmbeddedSystemSpinnerLabel.Position = [800 461 184 24];
            app.EmbeddedSystemSpinnerLabel.Text = 'Embedded System';

            % Create EmbeddedSystemSpinner
            app.EmbeddedSystemSpinner = uispinner(app.ResearchRecomenderUIFigure);
            app.EmbeddedSystemSpinner.Limits = [0 5];
            app.EmbeddedSystemSpinner.Position = [1063 462 100 22];

            % Create ComputerArchitectureSpinnerLabel
            app.ComputerArchitectureSpinnerLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.ComputerArchitectureSpinnerLabel.HorizontalAlignment = 'right';
            app.ComputerArchitectureSpinnerLabel.FontSize = 20;
            app.ComputerArchitectureSpinnerLabel.FontWeight = 'bold';
            app.ComputerArchitectureSpinnerLabel.Position = [799 392 225 24];
            app.ComputerArchitectureSpinnerLabel.Text = 'Computer Architecture';

            % Create CheckBox_1
            app.CheckBox_1 = uicheckbox(app.ResearchRecomenderUIFigure);
            app.CheckBox_1.Text = '';
            app.CheckBox_1.Position = [588 529 25 22];
            app.CheckBox_1.Value = true;

            % Create LowLevelProgrammingSpinnerLabel
            app.LowLevelProgrammingSpinnerLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.LowLevelProgrammingSpinnerLabel.HorizontalAlignment = 'right';
            app.LowLevelProgrammingSpinnerLabel.FontSize = 20;
            app.LowLevelProgrammingSpinnerLabel.FontWeight = 'bold';
            app.LowLevelProgrammingSpinnerLabel.Position = [799 427 240 24];
            app.LowLevelProgrammingSpinnerLabel.Text = 'Low Level Programming';

            % Create LowLevelProgrammingSpinner
            app.LowLevelProgrammingSpinner = uispinner(app.ResearchRecomenderUIFigure);
            app.LowLevelProgrammingSpinner.Limits = [0 5];
            app.LowLevelProgrammingSpinner.Position = [1065 428 97 22];

            % Create ComputerArchitectureSpinner
            app.ComputerArchitectureSpinner = uispinner(app.ResearchRecomenderUIFigure);
            app.ComputerArchitectureSpinner.Limits = [0 5];
            app.ComputerArchitectureSpinner.Position = [1064 396 100 22];

            % Create HighLevelProgrammingSpinner
            app.HighLevelProgrammingSpinner = uispinner(app.ResearchRecomenderUIFigure);
            app.HighLevelProgrammingSpinner.Limits = [0 5];
            app.HighLevelProgrammingSpinner.Position = [1065 327 100 22];

            % Create HighLevelProgrammingSpinnerLabel
            app.HighLevelProgrammingSpinnerLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.HighLevelProgrammingSpinnerLabel.HorizontalAlignment = 'right';
            app.HighLevelProgrammingSpinnerLabel.FontSize = 20;
            app.HighLevelProgrammingSpinnerLabel.FontWeight = 'bold';
            app.HighLevelProgrammingSpinnerLabel.Position = [799 326 244 24];
            app.HighLevelProgrammingSpinnerLabel.Text = 'High Level Programming';

            % Create MachineLearningSpinnerLabel
            app.MachineLearningSpinnerLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.MachineLearningSpinnerLabel.HorizontalAlignment = 'right';
            app.MachineLearningSpinnerLabel.FontSize = 20;
            app.MachineLearningSpinnerLabel.FontWeight = 'bold';
            app.MachineLearningSpinnerLabel.Position = [799 361 176 24];
            app.MachineLearningSpinnerLabel.Text = 'Machine Learning';

            % Create Image
            app.Image = uiimage(app.ResearchRecomenderUIFigure);
            app.Image.Position = [1 655 1192 100];
            app.Image.ImageSource = 'header.jpg';

            % Create MachineLearningSpinner
            app.MachineLearningSpinner = uispinner(app.ResearchRecomenderUIFigure);
            app.MachineLearningSpinner.Limits = [0 5];
            app.MachineLearningSpinner.Position = [1065 362 98 22];

            % Create ResearchAreasLabel
            app.ResearchAreasLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.ResearchAreasLabel.FontSize = 30;
            app.ResearchAreasLabel.FontWeight = 'bold';
            app.ResearchAreasLabel.Position = [75 584 233 36];
            app.ResearchAreasLabel.Text = 'Research Areas';

            % Create InterestsLabel_2
            app.InterestsLabel_2 = uilabel(app.ResearchRecomenderUIFigure);
            app.InterestsLabel_2.FontSize = 30;
            app.InterestsLabel_2.FontWeight = 'bold';
            app.InterestsLabel_2.Position = [769 584 255 36];
            app.InterestsLabel_2.Text = 'Interests';

            % Create Image2
            app.Image2 = uiimage(app.ResearchRecomenderUIFigure);
            app.Image2.Position = [765 531 23 18];
            app.Image2.ImageSource = 'security.png';

            % Create Image2_2
            app.Image2_2 = uiimage(app.ResearchRecomenderUIFigure);
            app.Image2_2.Position = [765 497 23 18];
            app.Image2_2.ImageSource = 'networking.png';

            % Create Image2_3
            app.Image2_3 = uiimage(app.ResearchRecomenderUIFigure);
            app.Image2_3.Position = [765 464 23 18];
            app.Image2_3.ImageSource = 'embeded.png';

            % Create Image2_4
            app.Image2_4 = uiimage(app.ResearchRecomenderUIFigure);
            app.Image2_4.Position = [765 430 23 18];
            app.Image2_4.ImageSource = 'coding.png';

            % Create Image2_5
            app.Image2_5 = uiimage(app.ResearchRecomenderUIFigure);
            app.Image2_5.Position = [765 398 23 18];
            app.Image2_5.ImageSource = 'architecture.png';

            % Create Image2_6
            app.Image2_6 = uiimage(app.ResearchRecomenderUIFigure);
            app.Image2_6.Position = [765 364 23 18];
            app.Image2_6.ImageSource = 'ml.png';

            % Create Image2_7
            app.Image2_7 = uiimage(app.ResearchRecomenderUIFigure);
            app.Image2_7.Position = [765 328 23 18];
            app.Image2_7.ImageSource = 'programing.png';

            % Create HeterogeneousPipelinesinEmbeddedProcessorsLabel
            app.HeterogeneousPipelinesinEmbeddedProcessorsLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.HeterogeneousPipelinesinEmbeddedProcessorsLabel.FontSize = 20;
            app.HeterogeneousPipelinesinEmbeddedProcessorsLabel.FontWeight = 'bold';
            app.HeterogeneousPipelinesinEmbeddedProcessorsLabel.Position = [75 353 500 35];
            app.HeterogeneousPipelinesinEmbeddedProcessorsLabel.Text = 'Heterogeneous Pipelines in Embedded Processors';

            % Create CheckBox_6
            app.CheckBox_6 = uicheckbox(app.ResearchRecomenderUIFigure);
            app.CheckBox_6.Text = '';
            app.CheckBox_6.Position = [588 359 25 22];
            app.CheckBox_6.Value = true;

            % Create ImageProcessingLabel
            app.ImageProcessingLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.ImageProcessingLabel.FontSize = 20;
            app.ImageProcessingLabel.FontWeight = 'bold';
            app.ImageProcessingLabel.Position = [75 317 177 35];
            app.ImageProcessingLabel.Text = 'Image Processing';

            % Create CheckBox_7
            app.CheckBox_7 = uicheckbox(app.ResearchRecomenderUIFigure);
            app.CheckBox_7.Text = '';
            app.CheckBox_7.Position = [588 323 25 22];
            app.CheckBox_7.Value = true;

            % Create Image2_8
            app.Image2_8 = uiimage(app.ResearchRecomenderUIFigure);
            app.Image2_8.Position = [766 289 23 18];
            app.Image2_8.ImageSource = 'imageprocessing.png';

            % Create ImageProcessingSpinner
            app.ImageProcessingSpinner = uispinner(app.ResearchRecomenderUIFigure);
            app.ImageProcessingSpinner.Limits = [0 5];
            app.ImageProcessingSpinner.Position = [1065 288 99 22];

            % Create ImageProcessingSpinnerLabel
            app.ImageProcessingSpinnerLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.ImageProcessingSpinnerLabel.HorizontalAlignment = 'right';
            app.ImageProcessingSpinnerLabel.FontSize = 20;
            app.ImageProcessingSpinnerLabel.FontWeight = 'bold';
            app.ImageProcessingSpinnerLabel.Position = [800 287 177 24];
            app.ImageProcessingSpinnerLabel.Text = 'Image Processing';

            % Create Image2_9
            app.Image2_9 = uiimage(app.ResearchRecomenderUIFigure);
            app.Image2_9.Position = [766 248 23 18];
            app.Image2_9.ImageSource = 'signal.png';

            % Create SignalProcessingSpinner
            app.SignalProcessingSpinner = uispinner(app.ResearchRecomenderUIFigure);
            app.SignalProcessingSpinner.Limits = [0 5];
            app.SignalProcessingSpinner.Position = [1065 247 101 22];

            % Create SignalProcessingSpinnerLabel
            app.SignalProcessingSpinnerLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.SignalProcessingSpinnerLabel.HorizontalAlignment = 'right';
            app.SignalProcessingSpinnerLabel.FontSize = 20;
            app.SignalProcessingSpinnerLabel.FontWeight = 'bold';
            app.SignalProcessingSpinnerLabel.Position = [800 246 179 24];
            app.SignalProcessingSpinnerLabel.Text = 'Signal Processing';

            % Create Image2_10
            app.Image2_10 = uiimage(app.ResearchRecomenderUIFigure);
            app.Image2_10.Position = [766 207 23 18];
            app.Image2_10.ImageSource = 'devops.png';

            % Create DevopsSpinner
            app.DevopsSpinner = uispinner(app.ResearchRecomenderUIFigure);
            app.DevopsSpinner.Limits = [0 5];
            app.DevopsSpinner.Position = [1065 206 101 22];

            % Create DevopsSpinnerLabel
            app.DevopsSpinnerLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.DevopsSpinnerLabel.HorizontalAlignment = 'right';
            app.DevopsSpinnerLabel.FontSize = 20;
            app.DevopsSpinnerLabel.FontWeight = 'bold';
            app.DevopsSpinnerLabel.Position = [800 205 78 24];
            app.DevopsSpinnerLabel.Text = 'Devops';

            % Create ResearchRecomenderLabel
            app.ResearchRecomenderLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.ResearchRecomenderLabel.FontSize = 50;
            app.ResearchRecomenderLabel.FontWeight = 'bold';
            app.ResearchRecomenderLabel.FontColor = [1 1 1];
            app.ResearchRecomenderLabel.Position = [75 674 558 62];
            app.ResearchRecomenderLabel.Text = 'Research Recomender';

            % Create CloudcomputingLabel
            app.CloudcomputingLabel = uilabel(app.ResearchRecomenderUIFigure);
            app.CloudcomputingLabel.FontSize = 20;
            app.CloudcomputingLabel.FontWeight = 'bold';
            app.CloudcomputingLabel.Position = [75 281 177 35];
            app.CloudcomputingLabel.Text = 'Cloud computing';

            % Create CheckBox_8
            app.CheckBox_8 = uicheckbox(app.ResearchRecomenderUIFigure);
            app.CheckBox_8.Text = '';
            app.CheckBox_8.Position = [588 287 25 22];
            app.CheckBox_8.Value = true;

            % Show the figure after all components are created
            app.ResearchRecomenderUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = recomendSystem_exported

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