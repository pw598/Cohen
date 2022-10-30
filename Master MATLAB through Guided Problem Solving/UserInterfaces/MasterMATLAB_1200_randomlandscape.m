function MasterMATLAB_1200_randomlandscape
% MasterMATLAB_1200_randomlandscape 
%    draw a random landscape based on the 
%    inverse Fourier transform of 2D noise tapered by a Gaussian.

% create figure but make invisible for now
figh = figure('Visible','off','windowstyle','normal');

% set its position ([ left bottom width height ])
set(figh,'Position',[  100   100   1500   700  ])

% need figure size for later
figsize = get(figh,'Position');
figsize = figsize(3:4);

%% GUI components

% drop-down menu for color map
htext1 = uicontrol('Style','text','String','Select colormap',...
           'Position',[.8*figsize(1) .92*figsize(2) 200 25]);

hcolor = uicontrol('Style','popupmenu',...
                   'String',{'Jet';'Bone';'HSV'},...
                   'Position',[.8*figsize(1) .8*figsize(2) 100 100],...
                   'Callback',@colorselect_Callback);



% slider to control roughness
htext2 = uicontrol('Style','text','String','Select smoothness',...
           'Position',[.8*figsize(1) .75*figsize(2) 200 25]);
       
hrough = uicontrol('Style','slider',...
                   'Min',.0001,'Max',.01,'Value',.001,...
                   'Position',[.8*figsize(1) .7*figsize(2) 200 25]);

               
               
               
% redraw button
hredraw = uicontrol('Style','pushbutton',...
                    'String','New landscape!',...
                    'Position',[.8*figsize(1) .6*figsize(2) 200 40],...
                    'Callback',@redraw_Callback);


% main axis for drawing
axh = axes('Units','pixels','Position',[50,60,900,600],'tag','axis2draw');

% align the components
align([hcolor,hrough,hredraw,htext1,htext2],'Center','None');

%% Initialize the UI.

% use normalized units for auto-resize
figh.Units   = 'normalized';
axh.Units    = 'normalized';
hcolor.Units = 'normalized';

% can also set multiple properties simultaneously
[ hredraw.Units,htext1.Units,htext2.Units,hrough.Units ] = deal( 'normalized' );

%% set up the surface axis

% create an empty surface
surfh = surf(axh,zeros(500));

% make it look a bit nicer
shading(axh,'interp');
axis(axh,'off')

% add user interactivity
rotate3d(axh,'on')

%% center GUI and turn it on

% Move the window to the center of the screen.
movegui(figh,'center')

% Make the window visible.
figh.Visible = 'on';

% finally, call the function to start with a landscape
redraw_Callback

%% functions that are called when interacting with the GUI

function redraw_Callback(source,eventdata) 
    
    % create 2D Gaussian
    [X,Y] = meshgrid(linspace(-2,2,500));
    gaus2d = exp( -(X.^2+Y.^2) / hrough.Value );
    
    % create data
    complexdata = rand(size(X)) .* exp(1i*rand(size(X))*2*pi);
    landscape = real(ifft2(fftshift(gaus2d).*complexdata));
    
    % update the data in the surface
    set(surfh,'ZData',landscape);
end

% function when selecting colorscheme
function colorselect_Callback(source,eventdata)
    % set colormap
    colormap(axh,hcolor.String{hcolor.Value})
end

end % end file function
