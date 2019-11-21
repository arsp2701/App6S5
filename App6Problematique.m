close all
clear all
clc

load('Accelero_Data_from_Moscow');
%% D�finition param�tres et donn�es connues
Temps        = t;           % Temps des donn�es des russes en s
Acc_mes      = acc_mes;     % Donn�es des russes en m/s^2
M_c          = 50;          % Masse de la capsule en kg
J_c          = 1.5;         % Inertie de la capsule en kg-m^2
R_mars       = 3397*10^3;   % Rayon de mars en m
Mu_mars      = 42830*10^9;  % Parametre gravitationelle de mars en m^3/s^2
S_c          = 0.8;         % Surface aero. de la capsule en m^2
d_c          = 0.05;        % Dimension de la capsule en m
C_do         = 1.2;         % Coefficient de train�e
C_Lalpha     = 0.8;         % Coefficient de portance
C_Malpha     = -0.07;       % Coefficient de couple
C_Mq         = -0.05;       % Coefficient d'amortissement
C_Mdelta     = 0.1;         % Coefficient de volet aero.
V_IniR       = 6100;        % Vitesse initiale exp�rience des russes en m/s
Gamma_IniR   = -90;         % Angle gamma initial exp�rience des russes en �
H_IniR       = 120000;      % Hauteur initiale exp�rience des russes en m
Theta_IniR   = -90;         % Angle theta initial exp�rience des russes en �
V_IniM       = 6100;        % Vitesse initiale du mandat en m/s
Gamma_IniM   = -20.5;       % Angle gamma initial du mandat en �
H_IniM       = 120000;      % Hauteur initiale du mandat en m
Theta_IniM   = -80;         % Angle theta initial du mandat en �
V_FinM1      = 250;         % Vitesse maximale optimale finale du mandat en m/s
V_FinM2      = 300;         % Vitesse maximale finale du mandat en m/s
H_FinM       = 10000;       % Hauteur du d�ploiment des parachutes (h finale) en m
T_Lim        = 45;          % Temps limite pour une force sur la capsule de plus de 2000N en s
Theta_cmdLim = 60;          % Angle maximale en absolue de la capsule en �
%% D�termination des param�tre Hs et Po
H_V_Trap = Temps(2)-Temps(1);
% D�termination de la vitesse selon l'acc�l�ration par m�thode des trap�ze
DpAccMes_a = (Acc_mes(2)-Acc_mes(1))/H_V_Trap;
DpAccMes_b = (Acc_mes(end)- Acc_mes(end-1))/H_V_Trap;

V_Mes_Trap   = H_V_Trap/2*(Acc_mes(1)+Acc_mes(end)+2*sum(Acc_mes(2:end-1)));
E_V_Mes_Trap = H_V_Trap^2/12*(DpAccMes_b-DpAccMes_a);

%int�grale point par point
V_Mes_Trap_Aff(length(Temps))=0;
for n=2:1:length(Temps)
    V_Mes_Trap_Aff(n) = H_V_Trap/2*(Acc_mes(1)+Acc_mes(n)+2*sum(Acc_mes(2:n-1)));
end
disp(V_Mes_Trap_Aff(11))
% D�termination de la vitesse selon l'acc�l�ration par m�thode de Simpson
DtAccMes_a = (Acc_mes(4)-3*Acc_mes(3)+3*Acc_mes(2)-Acc_mes(1))/H_V_Trap^3;
DtAccMes_b = (y(end)-3*y(end-1)+3*y(end-2)-y(end-3))/H_V_Trap^3;
int_s = H_V_Trap/3*(y(1)+y(end)+4*sum(y(2:2:end-1))+2*sum(y(3:2:end-1)));
erreur_simp = -H_V_Trap^4/180*(y(end)-y(1))*(DtAccMes_b-DtAccMes_a);

F(1)=0;
for n=3:2:length(Temps)
    F(((n-1)/2)+1) = H_V_Trap/3*(y(1)+y(n)+4*sum(y(2:2:n-1))+2*sum(y(3:2:n-1)));
end

plot (Temps(1:2:end),F)
hold on
plot(Temps,V_Mes_Trap_Aff);