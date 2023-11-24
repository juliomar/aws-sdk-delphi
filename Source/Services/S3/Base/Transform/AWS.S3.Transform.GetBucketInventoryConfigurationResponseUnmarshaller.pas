unit AWS.S3.Transform.GetBucketInventoryConfigurationResponseUnmarshaller;

interface

uses
  AWS.S3.Model.GetBucketInventoryConfigurationResponse, 
  AWS.Transform.ResponseUnmarshaller, 
  AWS.Runtime.Model, 
  AWS.Transform.UnmarshallerContext, 
  AWS.S3.Transform.InventoryConfigurationUnmarshaller, 
  AWS.Runtime.Exceptions, 
  System.SysUtils, 
  AWS.Internal.ErrorResponse, 
  AWS.Transform.ErrorResponseUnmarshaller, 
  System.Classes, 
  AWS.S3.Exception;

type
  IGetBucketInventoryConfigurationResponseUnmarshaller = IResponseUnmarshaller;
  
  TGetBucketInventoryConfigurationResponseUnmarshaller = class(TXmlResponseUnmarshaller, IGetBucketInventoryConfigurationResponseUnmarshaller)
  strict private
    class var FInstance: IGetBucketInventoryConfigurationResponseUnmarshaller;
    class procedure UnmarshallResult(AContext: TXmlUnmarshallerContext; AResponse: TGetBucketInventoryConfigurationResponse); static;
    class constructor Create;
  public
    function Unmarshall(AContext: TXmlUnmarshallerContext): TAmazonWebServiceResponse; overload; override;
    function UnmarshallException(AContext: TXmlUnmarshallerContext; AInnerException: Exception; AStatusCode: Integer): EAmazonServiceException; override;
    class function Instance: IGetBucketInventoryConfigurationResponseUnmarshaller; static;
  end;
  
implementation

{ TGetBucketInventoryConfigurationResponseUnmarshaller }

function TGetBucketInventoryConfigurationResponseUnmarshaller.Unmarshall(AContext: TXmlUnmarshallerContext): TAmazonWebServiceResponse;
var
  Response: TGetBucketInventoryConfigurationResponse;
begin
  Response := TGetBucketInventoryConfigurationResponse.Create;
  try
    AContext.AllowEmptyElementLookup.Add('SSE-S3');
    UnmarshallResult(AContext, Response);
    Result := Response;
    Response := nil;
  finally
    Response.Free;
  end;
end;

class procedure TGetBucketInventoryConfigurationResponseUnmarshaller.UnmarshallResult(AContext: TXmlUnmarshallerContext; AResponse: TGetBucketInventoryConfigurationResponse);
var
  OriginalDepth: Integer;
  TargetDepth: Integer;
begin
  OriginalDepth := AContext.CurrentDepth;
  TargetDepth := OriginalDepth + 1;
  while AContext.Read do
    if AContext.IsStartElement or AContext.IsAttribute then
      if AContext.TestExpression('InventoryConfiguration', TargetDepth) then
      begin
        var Unmarshaller := TInventoryConfigurationUnmarshaller.Instance;
        AResponse.InventoryConfiguration := Unmarshaller.Unmarshall(AContext);
        Continue;
      end
    else
      if AContext.IsEndElement and (AContext.CurrentDepth < OriginalDepth) then
        Exit;
end;

function TGetBucketInventoryConfigurationResponseUnmarshaller.UnmarshallException(AContext: TXmlUnmarshallerContext; AInnerException: Exception; AStatusCode: Integer): EAmazonServiceException;
var
  ErrorResponse: TErrorResponse;
  StreamCopy: TStream;
  ContextCopy: TXmlUnmarshallerContext;
begin
  ErrorResponse := TErrorResponseUnmarshaller.Instance.Unmarshall(AContext);
  try
    ErrorResponse.InnerException := AInnerException;
    ErrorResponse.StatusCode := AStatusCode;
    StreamCopy := TBytesStream.Create(AContext.GetResponseBodyBytes);
    try
      ContextCopy := TXmlUnmarshallerContext.Create(StreamCopy, False, nil);
      try
      finally
        ContextCopy.Free;
      end;
    finally
      StreamCopy.Free;
    end;
    Exit(EAmazonS3Exception.Create(ErrorResponse.Message, AInnerException, ErrorResponse.ErrorType, ErrorResponse.Code, ErrorResponse.RequestId, AStatusCode));
  finally
    ErrorResponse.Free;
  end;
end;

class constructor TGetBucketInventoryConfigurationResponseUnmarshaller.Create;
begin
  FInstance := TGetBucketInventoryConfigurationResponseUnmarshaller.Create;
end;

class function TGetBucketInventoryConfigurationResponseUnmarshaller.Instance: IGetBucketInventoryConfigurationResponseUnmarshaller;
begin
  Result := FInstance;
end;

end.
