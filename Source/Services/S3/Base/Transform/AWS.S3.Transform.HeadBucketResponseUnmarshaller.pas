unit AWS.S3.Transform.HeadBucketResponseUnmarshaller;

interface

uses
  AWS.S3.Model.HeadBucketResponse, 
  AWS.Transform.ResponseUnmarshaller, 
  AWS.Runtime.Model, 
  AWS.Transform.UnmarshallerContext, 
  AWS.Runtime.Exceptions, 
  System.SysUtils, 
  AWS.Internal.ErrorResponse, 
  AWS.Transform.ErrorResponseUnmarshaller, 
  System.Classes, 
  AWS.S3.Transform.NoSuchBucketExceptionUnmarshaller, 
  AWS.S3.Exception;

type
  IHeadBucketResponseUnmarshaller = IResponseUnmarshaller;
  
  THeadBucketResponseUnmarshaller = class(TXmlResponseUnmarshaller, IHeadBucketResponseUnmarshaller)
  strict private
    class var FInstance: IHeadBucketResponseUnmarshaller;
    class constructor Create;
  public
    function Unmarshall(AContext: TXmlUnmarshallerContext): TAmazonWebServiceResponse; overload; override;
    function UnmarshallException(AContext: TXmlUnmarshallerContext; AInnerException: Exception; AStatusCode: Integer): EAmazonServiceException; override;
    class function Instance: IHeadBucketResponseUnmarshaller; static;
  end;
  
implementation

{ THeadBucketResponseUnmarshaller }

function THeadBucketResponseUnmarshaller.Unmarshall(AContext: TXmlUnmarshallerContext): TAmazonWebServiceResponse;
var
  Response: THeadBucketResponse;
begin
  Response := THeadBucketResponse.Create;
  try
    Result := Response;
    Response := nil;
  finally
    Response.Free;
  end;
end;

function THeadBucketResponseUnmarshaller.UnmarshallException(AContext: TXmlUnmarshallerContext; AInnerException: Exception; AStatusCode: Integer): EAmazonServiceException;
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
        if ErrorResponse.Code = 'NoSuchBucketException' then
          Exit(TNoSuchBucketExceptionUnmarshaller.Instance.Unmarshall(ContextCopy, ErrorResponse));
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

class constructor THeadBucketResponseUnmarshaller.Create;
begin
  FInstance := THeadBucketResponseUnmarshaller.Create;
end;

class function THeadBucketResponseUnmarshaller.Instance: IHeadBucketResponseUnmarshaller;
begin
  Result := FInstance;
end;

end.
