unit AWS.S3.Model.UploadPartRequest;

interface

uses
  Bcl.Types.Nullable, 
  AWS.S3.Model.Request, 
  System.Classes, 
  AWS.S3.Enums;

type
  TUploadPartRequest = class;
  
  IUploadPartRequest = interface
    function GetBody: TBytesStream;
    procedure SetBody(const Value: TBytesStream);
    function GetKeepBody: Boolean;
    procedure SetKeepBody(const Value: Boolean);
    function GetBucketName: string;
    procedure SetBucketName(const Value: string);
    function GetContentLength: Int64;
    procedure SetContentLength(const Value: Int64);
    function GetContentMD5: string;
    procedure SetContentMD5(const Value: string);
    function GetExpectedBucketOwner: string;
    procedure SetExpectedBucketOwner(const Value: string);
    function GetKey: string;
    procedure SetKey(const Value: string);
    function GetPartNumber: Integer;
    procedure SetPartNumber(const Value: Integer);
    function GetRequestPayer: TRequestPayer;
    procedure SetRequestPayer(const Value: TRequestPayer);
    function GetSSECustomerAlgorithm: string;
    procedure SetSSECustomerAlgorithm(const Value: string);
    function GetSSECustomerKey: string;
    procedure SetSSECustomerKey(const Value: string);
    function GetSSECustomerKeyMD5: string;
    procedure SetSSECustomerKeyMD5(const Value: string);
    function GetUploadId: string;
    procedure SetUploadId(const Value: string);
    function Obj: TUploadPartRequest;
    function IsSetBody: Boolean;
    function IsSetBucketName: Boolean;
    function IsSetContentLength: Boolean;
    function IsSetContentMD5: Boolean;
    function IsSetExpectedBucketOwner: Boolean;
    function IsSetKey: Boolean;
    function IsSetPartNumber: Boolean;
    function IsSetRequestPayer: Boolean;
    function IsSetSSECustomerAlgorithm: Boolean;
    function IsSetSSECustomerKey: Boolean;
    function IsSetSSECustomerKeyMD5: Boolean;
    function IsSetUploadId: Boolean;
    property Body: TBytesStream read GetBody write SetBody;
    property KeepBody: Boolean read GetKeepBody write SetKeepBody;
    property BucketName: string read GetBucketName write SetBucketName;
    property ContentLength: Int64 read GetContentLength write SetContentLength;
    property ContentMD5: string read GetContentMD5 write SetContentMD5;
    property ExpectedBucketOwner: string read GetExpectedBucketOwner write SetExpectedBucketOwner;
    property Key: string read GetKey write SetKey;
    property PartNumber: Integer read GetPartNumber write SetPartNumber;
    property RequestPayer: TRequestPayer read GetRequestPayer write SetRequestPayer;
    property SSECustomerAlgorithm: string read GetSSECustomerAlgorithm write SetSSECustomerAlgorithm;
    property SSECustomerKey: string read GetSSECustomerKey write SetSSECustomerKey;
    property SSECustomerKeyMD5: string read GetSSECustomerKeyMD5 write SetSSECustomerKeyMD5;
    property UploadId: string read GetUploadId write SetUploadId;
  end;
  
  TUploadPartRequest = class(TAmazonS3Request, IUploadPartRequest)
  strict private
    FBody: TBytesStream;
    FKeepBody: Boolean;
    FBucketName: Nullable<string>;
    FContentLength: Nullable<Int64>;
    FContentMD5: Nullable<string>;
    FExpectedBucketOwner: Nullable<string>;
    FKey: Nullable<string>;
    FPartNumber: Nullable<Integer>;
    FRequestPayer: Nullable<TRequestPayer>;
    FSSECustomerAlgorithm: Nullable<string>;
    FSSECustomerKey: Nullable<string>;
    FSSECustomerKeyMD5: Nullable<string>;
    FUploadId: Nullable<string>;
    function GetBody: TBytesStream;
    procedure SetBody(const Value: TBytesStream);
    function GetKeepBody: Boolean;
    procedure SetKeepBody(const Value: Boolean);
    function GetBucketName: string;
    procedure SetBucketName(const Value: string);
    function GetContentLength: Int64;
    procedure SetContentLength(const Value: Int64);
    function GetContentMD5: string;
    procedure SetContentMD5(const Value: string);
    function GetExpectedBucketOwner: string;
    procedure SetExpectedBucketOwner(const Value: string);
    function GetKey: string;
    procedure SetKey(const Value: string);
    function GetPartNumber: Integer;
    procedure SetPartNumber(const Value: Integer);
    function GetRequestPayer: TRequestPayer;
    procedure SetRequestPayer(const Value: TRequestPayer);
    function GetSSECustomerAlgorithm: string;
    procedure SetSSECustomerAlgorithm(const Value: string);
    function GetSSECustomerKey: string;
    procedure SetSSECustomerKey(const Value: string);
    function GetSSECustomerKeyMD5: string;
    procedure SetSSECustomerKeyMD5(const Value: string);
    function GetUploadId: string;
    procedure SetUploadId(const Value: string);
  strict protected
    function Obj: TUploadPartRequest;
  public
    destructor Destroy; override;
    function IsSetBody: Boolean;
    function IsSetBucketName: Boolean;
    function IsSetContentLength: Boolean;
    function IsSetContentMD5: Boolean;
    function IsSetExpectedBucketOwner: Boolean;
    function IsSetKey: Boolean;
    function IsSetPartNumber: Boolean;
    function IsSetRequestPayer: Boolean;
    function IsSetSSECustomerAlgorithm: Boolean;
    function IsSetSSECustomerKey: Boolean;
    function IsSetSSECustomerKeyMD5: Boolean;
    function IsSetUploadId: Boolean;
    property Body: TBytesStream read GetBody write SetBody;
    property KeepBody: Boolean read GetKeepBody write SetKeepBody;
    property BucketName: string read GetBucketName write SetBucketName;
    property ContentLength: Int64 read GetContentLength write SetContentLength;
    property ContentMD5: string read GetContentMD5 write SetContentMD5;
    property ExpectedBucketOwner: string read GetExpectedBucketOwner write SetExpectedBucketOwner;
    property Key: string read GetKey write SetKey;
    property PartNumber: Integer read GetPartNumber write SetPartNumber;
    property RequestPayer: TRequestPayer read GetRequestPayer write SetRequestPayer;
    property SSECustomerAlgorithm: string read GetSSECustomerAlgorithm write SetSSECustomerAlgorithm;
    property SSECustomerKey: string read GetSSECustomerKey write SetSSECustomerKey;
    property SSECustomerKeyMD5: string read GetSSECustomerKeyMD5 write SetSSECustomerKeyMD5;
    property UploadId: string read GetUploadId write SetUploadId;
  end;
  
implementation

{ TUploadPartRequest }

destructor TUploadPartRequest.Destroy;
begin
  Body := nil;
  inherited;
end;

function TUploadPartRequest.Obj: TUploadPartRequest;
begin
  Result := Self;
end;

function TUploadPartRequest.GetBody: TBytesStream;
begin
  Result := FBody;
end;

procedure TUploadPartRequest.SetBody(const Value: TBytesStream);
begin
  if FBody <> Value then
  begin
    if not KeepBody then
      FBody.Free;
    FBody := Value;
  end;
end;

function TUploadPartRequest.GetKeepBody: Boolean;
begin
  Result := FKeepBody;
end;

procedure TUploadPartRequest.SetKeepBody(const Value: Boolean);
begin
  FKeepBody := Value;
end;

function TUploadPartRequest.IsSetBody: Boolean;
begin
  Result := FBody <> nil;
end;

function TUploadPartRequest.GetBucketName: string;
begin
  Result := FBucketName.ValueOrDefault;
end;

procedure TUploadPartRequest.SetBucketName(const Value: string);
begin
  FBucketName := Value;
end;

function TUploadPartRequest.IsSetBucketName: Boolean;
begin
  Result := FBucketName.HasValue;
end;

function TUploadPartRequest.GetContentLength: Int64;
begin
  Result := FContentLength.ValueOrDefault;
end;

procedure TUploadPartRequest.SetContentLength(const Value: Int64);
begin
  FContentLength := Value;
end;

function TUploadPartRequest.IsSetContentLength: Boolean;
begin
  Result := FContentLength.HasValue;
end;

function TUploadPartRequest.GetContentMD5: string;
begin
  Result := FContentMD5.ValueOrDefault;
end;

procedure TUploadPartRequest.SetContentMD5(const Value: string);
begin
  FContentMD5 := Value;
end;

function TUploadPartRequest.IsSetContentMD5: Boolean;
begin
  Result := FContentMD5.HasValue;
end;

function TUploadPartRequest.GetExpectedBucketOwner: string;
begin
  Result := FExpectedBucketOwner.ValueOrDefault;
end;

procedure TUploadPartRequest.SetExpectedBucketOwner(const Value: string);
begin
  FExpectedBucketOwner := Value;
end;

function TUploadPartRequest.IsSetExpectedBucketOwner: Boolean;
begin
  Result := FExpectedBucketOwner.HasValue;
end;

function TUploadPartRequest.GetKey: string;
begin
  Result := FKey.ValueOrDefault;
end;

procedure TUploadPartRequest.SetKey(const Value: string);
begin
  FKey := Value;
end;

function TUploadPartRequest.IsSetKey: Boolean;
begin
  Result := FKey.HasValue;
end;

function TUploadPartRequest.GetPartNumber: Integer;
begin
  Result := FPartNumber.ValueOrDefault;
end;

procedure TUploadPartRequest.SetPartNumber(const Value: Integer);
begin
  FPartNumber := Value;
end;

function TUploadPartRequest.IsSetPartNumber: Boolean;
begin
  Result := FPartNumber.HasValue;
end;

function TUploadPartRequest.GetRequestPayer: TRequestPayer;
begin
  Result := FRequestPayer.ValueOrDefault;
end;

procedure TUploadPartRequest.SetRequestPayer(const Value: TRequestPayer);
begin
  FRequestPayer := Value;
end;

function TUploadPartRequest.IsSetRequestPayer: Boolean;
begin
  Result := FRequestPayer.HasValue;
end;

function TUploadPartRequest.GetSSECustomerAlgorithm: string;
begin
  Result := FSSECustomerAlgorithm.ValueOrDefault;
end;

procedure TUploadPartRequest.SetSSECustomerAlgorithm(const Value: string);
begin
  FSSECustomerAlgorithm := Value;
end;

function TUploadPartRequest.IsSetSSECustomerAlgorithm: Boolean;
begin
  Result := FSSECustomerAlgorithm.HasValue;
end;

function TUploadPartRequest.GetSSECustomerKey: string;
begin
  Result := FSSECustomerKey.ValueOrDefault;
end;

procedure TUploadPartRequest.SetSSECustomerKey(const Value: string);
begin
  FSSECustomerKey := Value;
end;

function TUploadPartRequest.IsSetSSECustomerKey: Boolean;
begin
  Result := FSSECustomerKey.HasValue;
end;

function TUploadPartRequest.GetSSECustomerKeyMD5: string;
begin
  Result := FSSECustomerKeyMD5.ValueOrDefault;
end;

procedure TUploadPartRequest.SetSSECustomerKeyMD5(const Value: string);
begin
  FSSECustomerKeyMD5 := Value;
end;

function TUploadPartRequest.IsSetSSECustomerKeyMD5: Boolean;
begin
  Result := FSSECustomerKeyMD5.HasValue;
end;

function TUploadPartRequest.GetUploadId: string;
begin
  Result := FUploadId.ValueOrDefault;
end;

procedure TUploadPartRequest.SetUploadId(const Value: string);
begin
  FUploadId := Value;
end;

function TUploadPartRequest.IsSetUploadId: Boolean;
begin
  Result := FUploadId.HasValue;
end;

end.
