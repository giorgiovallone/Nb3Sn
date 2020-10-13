% --------------------------------------------------------------------- %
% Function strain_function_cable_z(strain)                              %
% Computes the strain function given the strain tensor                  %
% G. Vallone, 2020                                                      %
% --------------------------------------------------------------------- %
function spar = strain_function_cable_z(strain)
% Function strain_function_cable_z(strain)
% Computes the strain function given the strain tensor
% G. Vallone, 2020

global At_ratio

% Strand Elastic Properties
nu_strand = .36;

% Parameters for PIT cable
C1   = 0.735;
el0  = -0.18;
et0  = -nu_strand*el0+0.1;

% Cable Stack Model Pars.
Ar_ratio = At_ratio;

% Cable Pitch
phi_p = -20;
phi_p = phi_p*pi/180;

% Compute
[Nel, ~] = size(strain);
spar = zeros(Nel,1);

for ii = 1 : Nel

    ex = strain(ii,1);
    ey = strain(ii,2);
    exy = strain(ii,3);
    ez  = strain(ii,4); 
    
    eyz = 0;    exz = 0;  
   
    % Insert Area Ratios
    ex = ex*Ar_ratio;
    ey = ey*At_ratio;

    % ------ Rotation Part ------
    %     mat_eps = [ ex  exy exz ;
    %                 exy ey  eyz ;
    %                 exz eyz ez  ];
    %     T = [  cos(phi_p)   0   sin(phi_p)  ;
    %                0        1       0       ;
    %           -sin(phi_p)   0   cos(phi_p)  ];
    %     mat_eps = T*mat_eps*T';
    %     
    %     ex  = mat_eps(1,1);
    %   ey  = mat_eps(2,2);
    %   ez  = mat_eps(3,3);
    %   exy = mat_eps(1,2);
    %   eyz = mat_eps(2,3);
    %   exz = mat_eps(1,3);    
    % ----- End Rotation Part -----

    % Strain Percentage - From B. Paper
    ex  = ex*100;
    ey  = ey*100;
    ez  = ez*100;
    exy = exy*100;
    eyz = eyz*100;
    exz = exz*100;

    % Add initial component / also initial transversal for ez
    ex  = ex + et0;
    ey  = ey + et0;
    ez  = ez + el0;
    exy = exy; % No effect
    eyz = eyz; % No effect
    exz = exz; % No effect

    % Compute Invariants
    I1 = (ex+ey+ez);
    J2 = 1/6*((ex-ey)^2+(ey-ez)^2+(ex-ez)^2)+exy^2+eyz^2+exz^2;

    % Compute the Strain Function
    ads1 = -C1*(J2+3)/(J2+1)*J2;
    ads2 = -C1*(I1^2+3)/(I1^2+1)*(I1^2);
    spar(ii) = (exp(ads1)+exp(ads2))/2;

end
