function data = lerDados()
PATH = "Data_PL2";
ficheiro_path = dir(PATH);
numero_ficheiros = length(ficheiro_path)-2;
data = cell(numero_ficheiros,3);
string_patern = digitsPattern;

for i = 1:numero_ficheiros
    dados_exp = str2double(extract(ficheiro_path(i+2).name, string_patern));
    if(length(dados_exp) ~= 2)
        warning("Erro a ler conteudo da pasta, verifique a sua pasta e o parsing do ficheiro " + ficheiro_path(i+2).name);
        data = [];
        break
    end
    data{i,1} = (load(PATH + '\' + ficheiro_path(i+2).name));
    data{i,2} = dados_exp(2); %Guardar utilizador
    data{i,3} = dados_exp(1); %Guardar numero experiencia
end