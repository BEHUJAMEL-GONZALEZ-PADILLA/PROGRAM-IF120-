unit Unit1;

{$mode objfpc}{$H+}
interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, Unit2;

type

  TForm1 = class(TForm)
  private
    Natural: TNNatural;

    txtNumero: TEdit;
    txtPosicion: TEdit;
    txtDigito: TEdit;
    txtBase: TEdit;

    lblNumero: TLabel;
    lblPosicion: TLabel;
    lblDigito: TLabel;
    lblBase: TLabel;

    btnCrear: TButton;
    btnSetValor: TButton;
    btnGetValor: TButton;

    btnInsertar: TButton;
    btnObtener: TButton;
    btnEliminar: TButton;
    btnCantidad: TButton;
    btnSumar: TButton;
    btnPares: TButton;
    btnImpares: TButton;
    btnPrimosDig: TButton;
    btnMayor: TButton;
    btnMenor: TButton;

    btnInvertir: TButton;
    btnCapicua: TButton;
    btnPar: TButton;
    btnImpar: TButton;
    btnPrimo: TButton;
    btnBinario: TButton;
    btnOctal: TButton;
    btnHexadecimal: TButton;
    btnBaseN: TButton;
    btnRomano: TButton;
    btnLiteral: TButton;

    btnSalir: TButton;

    lblResultado: TLabel;
    txtResultado: TMemo;

    procedure CrearInterfaz;

    procedure CrearClick(Sender: TObject);
    procedure SetValorClick(Sender: TObject);
    procedure GetValorClick(Sender: TObject);

    procedure InsertarClick(Sender: TObject);
    procedure ObtenerClick(Sender: TObject);
    procedure EliminarClick(Sender: TObject);
    procedure CantidadClick(Sender: TObject);
    procedure SumarClick(Sender: TObject);
    procedure ParesClick(Sender: TObject);
    procedure ImparesClick(Sender: TObject);
    procedure PrimosDigClick(Sender: TObject);
    procedure MayorClick(Sender: TObject);
    procedure MenorClick(Sender: TObject);

    procedure InvertirClick(Sender: TObject);
    procedure CapicuaClick(Sender: TObject);
    procedure ParClick(Sender: TObject);
    procedure ImparClick(Sender: TObject);
    procedure PrimoClick(Sender: TObject);
    procedure BinarioClick(Sender: TObject);
    procedure OctalClick(Sender: TObject);
    procedure HexadecimalClick(Sender: TObject);
    procedure BaseNClick(Sender: TObject);
    procedure RomanoClick(Sender: TObject);
    procedure LiteralClick(Sender: TObject);

    procedure SalirClick(Sender: TObject);

    function LeerNumero: Boolean;
    function LeerPosicion: Integer;
    function LeerDigito: Integer;
    function LeerBase: Integer;

    procedure Mostrar(valorMostrar: String);
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  Form1: TForm1;

implementation

constructor TForm1.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);

  Natural := TNNatural.Crear;

  CrearInterfaz;
end;

destructor TForm1.Destroy;
begin
  Natural.Free;
  inherited Destroy;
end;

procedure TForm1.CrearInterfaz;
begin
  Caption := 'Natural';
  Width := 850;
  Height := 700;
  Position := poScreenCenter;

  lblNumero := TLabel.Create(Self);
  lblNumero.Parent := Self;
  lblNumero.Caption := 'Numero Natural:';
  lblNumero.Left := 30;
  lblNumero.Top := 25;

  txtNumero := TEdit.Create(Self);
  txtNumero.Parent := Self;
  txtNumero.Left := 150;
  txtNumero.Top := 20;
  txtNumero.Width := 200;
  txtNumero.Text := '12345';

  lblPosicion := TLabel.Create(Self);
  lblPosicion.Parent := Self;
  lblPosicion.Caption := 'Posicion:';
  lblPosicion.Left := 30;
  lblPosicion.Top := 65;

  txtPosicion := TEdit.Create(Self);
  txtPosicion.Parent := Self;
  txtPosicion.Left := 150;
  txtPosicion.Top := 60;
  txtPosicion.Width := 200;
  txtPosicion.Text := '1';

  lblDigito := TLabel.Create(Self);
  lblDigito.Parent := Self;
  lblDigito.Caption := 'Digito:';
  lblDigito.Left := 30;
  lblDigito.Top := 105;

  txtDigito := TEdit.Create(Self);
  txtDigito.Parent := Self;
  txtDigito.Left := 150;
  txtDigito.Top := 100;
  txtDigito.Width := 200;
  txtDigito.Text := '9';

  lblBase := TLabel.Create(Self);
  lblBase.Parent := Self;
  lblBase.Caption := 'Base N:';
  lblBase.Left := 30;
  lblBase.Top := 145;

  txtBase := TEdit.Create(Self);
  txtBase.Parent := Self;
  txtBase.Left := 150;
  txtBase.Top := 140;
  txtBase.Width := 200;
  txtBase.Text := '2';

  btnCrear := TButton.Create(Self);
  btnCrear.Parent := Self;
  btnCrear.Caption := 'CREAR';
  btnCrear.Left := 400;
  btnCrear.Top := 20;
  btnCrear.Width := 130;
  btnCrear.OnClick := @CrearClick;

  btnSetValor := TButton.Create(Self);
  btnSetValor.Parent := Self;
  btnSetValor.Caption := 'SETVALOR';
  btnSetValor.Left := 540;
  btnSetValor.Top := 20;
  btnSetValor.Width := 130;
  btnSetValor.OnClick := @SetValorClick;

  btnGetValor := TButton.Create(Self);
  btnGetValor.Parent := Self;
  btnGetValor.Caption := 'GETVALOR';
  btnGetValor.Left := 680;
  btnGetValor.Top := 20;
  btnGetValor.Width := 130;
  btnGetValor.OnClick := @GetValorClick;

  btnInsertar := TButton.Create(Self);
  btnInsertar.Parent := Self;
  btnInsertar.Caption := 'INSERTAR';
  btnInsertar.Left := 30;
  btnInsertar.Top := 200;
  btnInsertar.Width := 120;
  btnInsertar.OnClick := @InsertarClick;

  btnObtener := TButton.Create(Self);
  btnObtener.Parent := Self;
  btnObtener.Caption := 'OBTENER';
  btnObtener.Left := 160;
  btnObtener.Top := 200;
  btnObtener.Width := 120;
  btnObtener.OnClick := @ObtenerClick;

  btnEliminar := TButton.Create(Self);
  btnEliminar.Parent := Self;
  btnEliminar.Caption := 'ELIMINAR';
  btnEliminar.Left := 290;
  btnEliminar.Top := 200;
  btnEliminar.Width := 120;
  btnEliminar.OnClick := @EliminarClick;

  btnCantidad := TButton.Create(Self);
  btnCantidad.Parent := Self;
  btnCantidad.Caption := 'CANTIDAD';
  btnCantidad.Left := 420;
  btnCantidad.Top := 200;
  btnCantidad.Width := 120;
  btnCantidad.OnClick := @CantidadClick;

  btnSumar := TButton.Create(Self);
  btnSumar.Parent := Self;
  btnSumar.Caption := 'SUMAR';
  btnSumar.Left := 550;
  btnSumar.Top := 200;
  btnSumar.Width := 120;
  btnSumar.OnClick := @SumarClick;

  btnPares := TButton.Create(Self);
  btnPares.Parent := Self;
  btnPares.Caption := 'PARES';
  btnPares.Left := 680;
  btnPares.Top := 200;
  btnPares.Width := 120;
  btnPares.OnClick := @ParesClick;

  btnImpares := TButton.Create(Self);
  btnImpares.Parent := Self;
  btnImpares.Caption := 'IMPARES';
  btnImpares.Left := 30;
  btnImpares.Top := 240;
  btnImpares.Width := 120;
  btnImpares.OnClick := @ImparesClick;

  btnPrimosDig := TButton.Create(Self);
  btnPrimosDig.Parent := Self;
  btnPrimosDig.Caption := 'PRIMOS DIG.';
  btnPrimosDig.Left := 160;
  btnPrimosDig.Top := 240;
  btnPrimosDig.Width := 120;
  btnPrimosDig.OnClick := @PrimosDigClick;

  btnMayor := TButton.Create(Self);
  btnMayor.Parent := Self;
  btnMayor.Caption := 'MAYOR';
  btnMayor.Left := 290;
  btnMayor.Top := 240;
  btnMayor.Width := 120;
  btnMayor.OnClick := @MayorClick;

  btnMenor := TButton.Create(Self);
  btnMenor.Parent := Self;
  btnMenor.Caption := 'MENOR';
  btnMenor.Left := 420;
  btnMenor.Top := 240;
  btnMenor.Width := 120;
  btnMenor.OnClick := @MenorClick;

  btnInvertir := TButton.Create(Self);
  btnInvertir.Parent := Self;
  btnInvertir.Caption := 'INVERTIR';
  btnInvertir.Left := 30;
  btnInvertir.Top := 310;
  btnInvertir.Width := 120;
  btnInvertir.OnClick := @InvertirClick;

  btnCapicua := TButton.Create(Self);
  btnCapicua.Parent := Self;
  btnCapicua.Caption := 'CAPICUA';
  btnCapicua.Left := 160;
  btnCapicua.Top := 310;
  btnCapicua.Width := 120;
  btnCapicua.OnClick := @CapicuaClick;

  btnPar := TButton.Create(Self);
  btnPar.Parent := Self;
  btnPar.Caption := 'PAR';
  btnPar.Left := 290;
  btnPar.Top := 310;
  btnPar.Width := 120;
  btnPar.OnClick := @ParClick;

  btnImpar := TButton.Create(Self);
  btnImpar.Parent := Self;
  btnImpar.Caption := 'IMPAR';
  btnImpar.Left := 420;
  btnImpar.Top := 310;
  btnImpar.Width := 120;
  btnImpar.OnClick := @ImparClick;

  btnPrimo := TButton.Create(Self);
  btnPrimo.Parent := Self;
  btnPrimo.Caption := 'PRIMO';
  btnPrimo.Left := 550;
  btnPrimo.Top := 310;
  btnPrimo.Width := 120;
  btnPrimo.OnClick := @PrimoClick;

  btnBinario := TButton.Create(Self);
  btnBinario.Parent := Self;
  btnBinario.Caption := 'BINARIO';
  btnBinario.Left := 680;
  btnBinario.Top := 310;
  btnBinario.Width := 120;
  btnBinario.OnClick := @BinarioClick;

  btnOctal := TButton.Create(Self);
  btnOctal.Parent := Self;
  btnOctal.Caption := 'OCTAL';
  btnOctal.Left := 30;
  btnOctal.Top := 350;
  btnOctal.Width := 120;
  btnOctal.OnClick := @OctalClick;

  btnHexadecimal := TButton.Create(Self);
  btnHexadecimal.Parent := Self;
  btnHexadecimal.Caption := 'HEXADECIMAL';
  btnHexadecimal.Left := 160;
  btnHexadecimal.Top := 350;
  btnHexadecimal.Width := 120;
  btnHexadecimal.OnClick := @HexadecimalClick;

  btnBaseN := TButton.Create(Self);
  btnBaseN.Parent := Self;
  btnBaseN.Caption := 'BASE N';
  btnBaseN.Left := 290;
  btnBaseN.Top := 350;
  btnBaseN.Width := 120;
  btnBaseN.OnClick := @BaseNClick;

  btnRomano := TButton.Create(Self);
  btnRomano.Parent := Self;
  btnRomano.Caption := 'ROMANO';
  btnRomano.Left := 420;
  btnRomano.Top := 350;
  btnRomano.Width := 120;
  btnRomano.OnClick := @RomanoClick;

  btnLiteral := TButton.Create(Self);
  btnLiteral.Parent := Self;
  btnLiteral.Caption := 'LITERAL';
  btnLiteral.Left := 550;
  btnLiteral.Top := 350;
  btnLiteral.Width := 120;
  btnLiteral.OnClick := @LiteralClick;

  btnSalir := TButton.Create(Self);
  btnSalir.Parent := Self;
  btnSalir.Caption := 'SALIR';
  btnSalir.Left := 680;
  btnSalir.Top := 350;
  btnSalir.Width := 120;
  btnSalir.OnClick := @SalirClick;

  lblResultado := TLabel.Create(Self);
  lblResultado.Parent := Self;
  lblResultado.Caption := 'RESULTADO:';
  lblResultado.Left := 30;
  lblResultado.Top := 410;

  txtResultado := TMemo.Create(Self);
  txtResultado.Parent := Self;
  txtResultado.Left := 30;
  txtResultado.Top := 435;
  txtResultado.Width := 770;
  txtResultado.Height := 180;
end;

function TForm1.LeerNumero: Boolean;
var
  n: Integer;
begin
  Result := TryStrToInt(Trim(txtNumero.Text), n);

  if not Result then
  begin
    ShowMessage('Ingrese un numero natural valido.');
    Exit;
  end;

  if n < 0 then
  begin
    ShowMessage('El numero no puede ser negativo.');
    Result := False;
    Exit;
  end;

  Natural.SetValor(n);
end;

function TForm1.LeerPosicion: Integer;
begin
  if not TryStrToInt(Trim(txtPosicion.Text), Result) then
  begin
    ShowMessage('Posicion invalida.');
    Result := -1;
  end;
end;

function TForm1.LeerDigito: Integer;
begin
  if not TryStrToInt(Trim(txtDigito.Text), Result) then
  begin
    ShowMessage('Digito invalido.');
    Result := -1;
  end;
end;

function TForm1.LeerBase: Integer;
begin
  if not TryStrToInt(Trim(txtBase.Text), Result) then
  begin
    ShowMessage('Base invalida.');
    Result := -1;
  end;
end;

procedure TForm1.Mostrar(valorMostrar: String);
begin
  txtResultado.Clear;
  txtResultado.Lines.Add(valorMostrar);
end;

procedure TForm1.CrearClick(Sender: TObject);
begin
  Natural.Free;
  Natural := TNNatural.Crear;
  Natural.SetValor(0);

  Mostrar('Objeto TNNatural creado. Valor = 0');
end;

procedure TForm1.SetValorClick(Sender: TObject);
begin
  if LeerNumero then
    Mostrar('Valor establecido: ' + IntToStr(Natural.GetValor));
end;

procedure TForm1.GetValorClick(Sender: TObject);
begin
  Mostrar('Valor actual: ' + IntToStr(Natural.GetValor));
end;

procedure TForm1.InsertarClick(Sender: TObject);
var
  pos, dig: Integer;
begin
  pos := LeerPosicion;
  dig := LeerDigito;

  if (pos = -1) or (dig = -1) then
    Exit;

  Natural.Insertar(pos, dig);
  Mostrar('Resultado: ' + IntToStr(Natural.GetValor));
end;

procedure TForm1.ObtenerClick(Sender: TObject);
var
  pos: Integer;
begin
  pos := LeerPosicion;

  if pos = -1 then
    Exit;

  Mostrar('Digito obtenido: ' + IntToStr(Natural.Obtener(pos)));
end;

procedure TForm1.EliminarClick(Sender: TObject);
var
  pos: Integer;
begin
  pos := LeerPosicion;

  if pos = -1 then
    Exit;

  Natural.Eliminar(pos);
  Mostrar('Resultado: ' + IntToStr(Natural.GetValor));
end;

procedure TForm1.CantidadClick(Sender: TObject);
begin
  Mostrar('Cantidad de digitos: ' + IntToStr(Natural.Cantidad));
end;

procedure TForm1.SumarClick(Sender: TObject);
begin
  Mostrar('Suma de digitos: ' + IntToStr(Natural.Sumar));
end;

procedure TForm1.ParesClick(Sender: TObject);
begin
  Mostrar('Cantidad de digitos pares: ' + IntToStr(Natural.Pares));
end;

procedure TForm1.ImparesClick(Sender: TObject);
begin
  Mostrar('Cantidad de digitos impares: ' + IntToStr(Natural.Impares));
end;

procedure TForm1.PrimosDigClick(Sender: TObject);
begin
  Mostrar('Cantidad de digitos primos: ' + IntToStr(Natural.Primos));
end;

procedure TForm1.MayorClick(Sender: TObject);
begin
  Mostrar('Digito mayor: ' + IntToStr(Natural.Mayor));
end;

procedure TForm1.MenorClick(Sender: TObject);
begin
  Mostrar('Digito menor: ' + IntToStr(Natural.Menor));
end;

procedure TForm1.InvertirClick(Sender: TObject);
begin
  Mostrar('Numero invertido: ' + IntToStr(Natural.Invertir));
end;

procedure TForm1.CapicuaClick(Sender: TObject);
begin
  if Natural.Capicua then
    Mostrar('El numero ES capicua.')
  else
    Mostrar('El numero NO es capicua.');
end;

procedure TForm1.ParClick(Sender: TObject);
begin
  if Natural.EsPar then
    Mostrar('El numero ES par.')
  else
    Mostrar('El numero NO es par.');
end;

procedure TForm1.ImparClick(Sender: TObject);
begin
  if Natural.EsImpar then
    Mostrar('El numero ES impar.')
  else
    Mostrar('El numero NO es impar.');
end;

procedure TForm1.PrimoClick(Sender: TObject);
begin
  if Natural.EsPrimo then
    Mostrar('El numero ES primo.')
  else
    Mostrar('El numero NO es primo.');
end;

procedure TForm1.BinarioClick(Sender: TObject);
begin
  Mostrar('Binario: ' + Natural.Binario);
end;

procedure TForm1.OctalClick(Sender: TObject);
begin
  Mostrar('Octal: ' + Natural.Octal);
end;

procedure TForm1.HexadecimalClick(Sender: TObject);
begin
  Mostrar('Hexadecimal: ' + Natural.Hexadecimal);
end;

procedure TForm1.BaseNClick(Sender: TObject);
var
  base: Integer;
begin
  base := LeerBase;

  if base = -1 then
    Exit;

  if (base < 2) or (base > 36) then
  begin
    ShowMessage('La base debe estar entre 2 y 36.');
    Exit;
  end;

  Mostrar('Base ' + IntToStr(base) + ': ' + Natural.BaseN(base));
end;

procedure TForm1.RomanoClick(Sender: TObject);
begin
  if Natural.Romano = '' then
    Mostrar('El numero debe estar entre 1 y 3999.')
  else
    Mostrar('Romano: ' + Natural.Romano);
end;

procedure TForm1.LiteralClick(Sender: TObject);
begin
  Mostrar('Literal: ' + Natural.Literal);
end;

procedure TForm1.SalirClick(Sender: TObject);
begin
  Close;
end;

end.


