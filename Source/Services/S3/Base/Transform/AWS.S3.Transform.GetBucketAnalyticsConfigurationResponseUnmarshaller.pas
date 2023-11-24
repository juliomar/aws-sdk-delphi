unit AWS.S3.Transform.GetBucketAnalyticsConfigurationResponseUnmarshaller;

interface

uses
  AWS.S3.Model.GetBucketAnalyticsConfigurationResponse, 
  AWS.Transform.ResponseUnmarshaller, 
  AWS.Runtime.Model, 
  AWS.Transform.UnmarshallerContext, 
  AWS.S3.Transform.AnalyticsConfigurationUnmarshaller, 
  AWS.Runtime.Exceptions, 
  System.SysUtils, 
  AWS.Internal.ErrorResponse, 
  AWS.Transform.ErrorResponseUnmarshaller, 
  System.Classes, 
  AWS.S3.Exception;

type
  IGetBucketAnalyticsConfigurationResponseUnmarshaller = IResponseUnmarshaller;
  
  TGetBucketAnalyticsConfigurationResponseUnmarshaller = class(TXmlResponseUnmarshaller, IGetBucketAnalyticsConfigurationResponseUnmarshaller)
  strict private
    class var FInstance: IGetBucketAnalyticsConfigurationResponseUnmarshaller;
    class procedure UnmarshallResult(AContext: TXmlUnmarshallerContext; AResponse: TGetBucketAnalyticsConfigurationResponse); static;
    class constructor Create;
  public
    function Unmarshall(AContext: TXmlUnmarshallerContext): TAmazonWebServiceResponse; overload; override;
    function UnmarshallException(AContext: TXmlUnmarshallerContext; AInnerException: Exception; AStatusCode: Integer): EAmazonServiceException; override;
    class function Instance: IGetBucketAnalyticsConfigurationResponseUnmarshaller; static;
  end;
  
implementation

{ TGetBucketAnalyticsConfigurationResponseUnmarshaller }

function TGetBucketAnalyticsConfigurationResponseUnmarshaller.Unmarshall(AContext: TXmlUnmarshallerContext): TAmazonWebServiceResponse;
var
  Response: TGetBucketAnalyticsConfigurationResponse;
begin
  Response := TGetBucketAnalyticsConfigurationResponse.Create;
  try
    UnmarshallResult(AContext, Response);
    Result := Response;
    Response := nil;
  finally
    Response.Free;
  end;
end;

class procedure TGetBucketAnalyticsConfigurationResponseUnmarshaller.UnmarshallResult(AContext: TXmlUnmarshallerContext; AResponse: TGetBucketAnalyticsConfigurationResponse);
var
  OriginalDepth: Integer;
  TargetDepth: Integer;
begin
  OriginalDepth := AContext.CurrentDepth;
  TargetDepth := OriginalDepth + 1;
  while AContext.Read do
    if AContext.IsStartElement or AContext.IsAttribute then
      if AContext.TestExpression('AnalyticsConfiguration', TargetDepth) then
      begin
        var Unmarshaller := TAnalyticsConfigurationUnmarshaller.Instance;
        AResponse.AnalyticsConfiguration := Unmarshaller.Unmarshall(AContext);
        Continue;
      end
    else
      if AContext.IsEndElement and (AContext.CurrentDepth < OriginalDepth) then
        Exit;
end;

function TGetBucketAnalyticsConfigurationResponseUnmarshaller.UnmarshallException(AContext: TXmlUnmarshallerContext; AInnerException: Exception; AStatusCode: Integer): EAmazonServiceException;
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

class constructor TGetBucketAnalyticsConfigurationResponseUnmarshaller.Create;
begin
  FInstance := TGetBucketAnalyticsConfigurationResponseUnmarshaller.Create;
end;

class function TGetBucketAnalyticsConfigurationResponseUnmarshaller.Instance: IGetBucketAnalyticsConfigurationResponseUnmarshaller;
begin
  Result := FInstance;
end;

end.
