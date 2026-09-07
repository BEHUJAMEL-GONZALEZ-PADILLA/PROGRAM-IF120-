unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  SysUtils;

type

  TNNatural = class
  private
    valor: Integer;

    function EsPrimoNumero(n: Integer): Boolean;
    function NumeroDigitos: Integer;
    function Potencia10(n: Integer): Integer;
    function DigitoEn(pos: Integer): Integer;

  public
    constructor Crear();

    procedure SetValor(val: Integer);
    function GetValor: Integer;

    // Operaciones sobre dígitos
    procedure Insertar(pos: Integer; dig: Integer);
    function Obtener(pos: Integer): Integer;
    procedure Eliminar(pos: Integer);
    function Cantidad: Integer;
    function Sumar: Integer;
    function Pares: Integer;
    function Impares: Integer;
    function Primos: Integer;
    function Mayor: Integer;
    function Menor: Integer;

    // Operaciones sobre enteros
    function Invertir: Integer;
    function Capicua: Boolean;
    function EsPar: Boolean;
    function EsImpar: Boolean;
    function EsPrimo: Boolean;
    function Binario: String;
    function Octal: String;
    function Hexadecimal: String;
    function BaseN(base: Integer): String;
    function Romano: String;
    function Literal: String;
  end;

implementation

constructor TNNatural.Crear();
begin
  valor := 0;
end;

procedure TNNatural.SetValor(val: Integer);
begin
  if val < 0 then
    valor := 0
  else
    valor := val;
end;

function TNNatural.GetValor: Integer;
begin
  Result := valor;
end;

function TNNatural.Potencia10(n: Integer): Integer;
var
  i: Integer;
begin
  Result := 1;

  for i := 1 to n do
    Result := Result * 10;
end;

function TNNatural.NumeroDigitos: Integer;
var
  aux: Integer;
begin
  aux := valor;

  if aux = 0 then
  begin
    Result := 1;
    Exit;
  end;

  Result := 0;

  while aux > 0 do
  begin
    aux := aux div 10;
    Inc(Result);
  end;
end;

function TNNatural.DigitoEn(pos: Integer): Integer;
var
  cant: Integer;
  potencia: Integer;
begin
  cant := NumeroDigitos;

  if (pos < 1) or (pos > cant) then
  begin
    Result := -1;
    Exit;
  end;

  potencia := Potencia10(cant - pos);
  Result := (valor div potencia) mod 10;
end;

function TNNatural.Obtener(pos: Integer): Integer;
begin
  Result := DigitoEn(pos);
end;

procedure TNNatural.Insertar(pos: Integer; dig: Integer);
var
  texto: String;
  nuevo: String;
begin
  if (dig < 0) or (dig > 9) then
    Exit;

  texto := IntToStr(valor);

  if (pos < 1) or (pos > Length(texto) + 1) then
    Exit;

  nuevo := Copy(texto, 1, pos - 1) +
           IntToStr(dig) +
           Copy(texto, pos, Length(texto));

  valor := StrToInt(nuevo);
end;

procedure TNNatural.Eliminar(pos: Integer);
var
  texto: String;
  nuevo: String;
begin
  texto := IntToStr(valor);

  if (pos < 1) or (pos > Length(texto)) then
    Exit;

  nuevo := Copy(texto, 1, pos - 1) +
           Copy(texto, pos + 1, Length(texto));

  if nuevo = '' then
    valor := 0
  else
    valor := StrToInt(nuevo);
end;

function TNNatural.Cantidad: Integer;
begin
  Result := NumeroDigitos;
end;

function TNNatural.Sumar: Integer;
var
  aux: Integer;
begin
  aux := valor;
  Result := 0;

  if aux = 0 then
    Exit;

  while aux > 0 do
  begin
    Result := Result + (aux mod 10);
    aux := aux div 10;
  end;
end;

function TNNatural.Pares: Integer;
var
  aux: Integer;
  dig: Integer;
begin
  aux := valor;
  Result := 0;

  if aux = 0 then
  begin
    Result := 1;
    Exit;
  end;

  while aux > 0 do
  begin
    dig := aux mod 10;

    if (dig mod 2 = 0) then
      Inc(Result);

    aux := aux div 10;
  end;
end;

function TNNatural.Impares: Integer;
var
  aux: Integer;
  dig: Integer;
begin
  aux := valor;
  Result := 0;

  while aux > 0 do
  begin
    dig := aux mod 10;

    if (dig mod 2 <> 0) then
      Inc(Result);

    aux := aux div 10;
  end;
end;

function TNNatural.EsPrimoNumero(n: Integer): Boolean;
var
  i: Integer;
begin
  if n < 2 then
  begin
    Result := False;
    Exit;
  end;

  if n = 2 then
  begin
    Result := True;
    Exit;
  end;

  if n mod 2 = 0 then
  begin
    Result := False;
    Exit;
  end;

  i := 3;

  while i * i <= n do
  begin
    if n mod i = 0 then
    begin
      Result := False;
      Exit;
    end;

    i := i + 2;
  end;

  Result := True;
end;

function TNNatural.Primos: Integer;
var
  aux: Integer;
  dig: Integer;
begin
  aux := valor;
  Result := 0;

  if aux = 0 then
    Exit;

  while aux > 0 do
  begin
    dig := aux mod 10;

    if EsPrimoNumero(dig) then
      Inc(Result);

    aux := aux div 10;
  end;
end;

function TNNatural.Mayor: Integer;
var
  aux: Integer;
  dig: Integer;
begin
  aux := valor;
  Result := 0;

  if aux = 0 then
    Exit;

  while aux > 0 do
  begin
    dig := aux mod 10;

    if dig > Result then
      Result := dig;

    aux := aux div 10;
  end;
end;

function TNNatural.Menor: Integer;
var
  aux: Integer;
  dig: Integer;
begin
  if valor = 0 then
  begin
    Result := 0;
    Exit;
  end;

  aux := valor;
  Result := 9;

  while aux > 0 do
  begin
    dig := aux mod 10;

    if dig < Result then
      Result := dig;

    aux := aux div 10;
  end;
end;

function TNNatural.Invertir: Integer;
var
  aux: Integer;
  dig: Integer;
begin
  aux := valor;
  Result := 0;

  while aux > 0 do
  begin
    dig := aux mod 10;
    Result := Result * 10 + dig;
    aux := aux div 10;
  end;
end;

function TNNatural.Capicua: Boolean;
begin
  Result := valor = Invertir;
end;

function TNNatural.EsPar: Boolean;
begin
  Result := valor mod 2 = 0;
end;

function TNNatural.EsImpar: Boolean;
begin
  Result := valor mod 2 <> 0;
end;

function TNNatural.EsPrimo: Boolean;
begin
  Result := EsPrimoNumero(valor);
end;

function TNNatural.basen(base: integer): string;
var
aux,r:integer;
cad:string;
digitos:string;
begin
digitos:='0123456789ABCDEF';
aux:=valor;
cad:='';
if(aux=0) then
result:='0'
else
  begin
  while aux>0 do
begin
r:=aux mod base;
cad:=digitos[r+1]+cad;
aux:= aux div base;
end;
result:=cad;
end;
end;

function TNNatural.binario(): string;
begin
result:=basen(2);
end;

function TNNatural.octal(): string;
begin
result:=basen(8);
end;

function TNNatural.hexadecimal(): string;
begin
result:=basen(16);
end;

function TNNatural.romano(): string;
const
val_rom:array[1..13]of integer =(1000,900,500,400,100,90,50,40,10,9,5,4,1);
let_rom:array[1..13] of string =( 'M' , 'CM' , 'D' , 'CD' , 'C' , 'XC' , 'L' , 'XL' , 'x' , 'IX' , 'V' , 'IV', 'I' );
var
aux,i:integer;
cad:string;
begin
aux:=valor;
cad:='';
for i:= 1 to 13 do
begin
while (aux >= val_rom[i])do
begin
cad:= cad+let_rom[i];
aux:=aux-val_rom[i];
end;
end;
result:=cad;
end;

function TNNatural.literal(): string;
var
  u, d, c: integer;
  cad: string;
  unidades: array[0..9] of string;
  decenas: array[0..9] of string;
  centenas: array[0..9] of string;
  especiales: array[10..19] of string;
begin
  if valor = 0 then Exit('Cero');
  if valor > 999 then

  unidades[0]:=''; unidades[1]:='Uno'; unidades[2]:='Dos'; unidades[3]:='Tres'; unidades[4]:='Cuatro'; unidades[5]:='Cinco'; unidades[6]:='Seis'; unidades[7]:='Siete'; unidades[8]:='Ocho'; unidades[9]:='Nueve';
  especiales[10]:='Diez'; especiales[11]:='Once'; especiales[12]:='Doce'; especiales[13]:='Trece'; especiales[14]:='Catorce'; especiales[15]:='Quince'; especiales[16]:='Dieciseis'; especiales[17]:='Diecisiete'; especiales[18]:='Dieciocho'; especiales[19]:='Diecinueve';
  decenas[0]:=''; decenas[1]:='Diez'; decenas[2]:='Veinte'; decenas[3]:='Treinta'; decenas[4]:='Cuarenta'; decenas[5]:='Cincuenta'; decenas[6]:='Sesenta'; decenas[7]:='Setenta'; decenas[8]:='Ochenta'; decenas[9]:='Noventa';
  centenas[0]:=''; centenas[1]:='Ciento'; centenas[2]:='Doscientos'; centenas[3]:='Trescientos'; centenas[4]:='Cuatrocientos'; centenas[5]:='Quinientos'; centenas[6]:='Seiscientos'; centenas[7]:='Setecientos'; centenas[8]:='Ochocientos'; centenas[9]:='Novecientos';

  c := (valor div 100) mod 10;
  d := (valor div 10) mod 10;
  u := valor mod 10;
  cad := '';
  if valor = 100 then cad := 'Cien'
  else cad := centenas[c];
  if cad <> '' then cad := cad + ' ';
  if d = 1 then
    cad := cad + especiales[10 + u]
  else if (d = 2) and (u <> 0) then
    cad := cad + 'Veinti' + LowerCase(unidades[u])
  else begin
    cad := cad + decenas[d];
    if (d > 2) and (u > 0) then cad := cad + ' y ';
    if (d <> 1) and (not ((d = 2) and (u <> 0))) then cad := cad + unidades[u];
  end;

  Result := Trim(cad);
end;

end.

