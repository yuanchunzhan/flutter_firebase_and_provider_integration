class StatusCode{
  final String?
  code,
  status,
  category,
  explain;

  StatusCode(
      this.code,
      this.status,
      this.category,
      this.explain
      );

  static Map codeIdMap(){
    List<StatusCode> list = statusList;
    var codeMap = {};
    for (StatusCode status in list){
      codeMap.addAll({status.code : status});
    }
    return codeMap;
  }

  static StatusCode getStatusByCode(String code){
    var codeMap = codeIdMap();
    return codeMap[code];
  }


}

// Basically, we extract data from database.
// For some reason, I created the list demo below.

List<StatusCode> statusList = [
  StatusCode('100', 'Continue', 'Information', 'client should continue the request or ignore the response if the request is already finished'),
  StatusCode('200', 'OK', 'Successful', 'The request succeeded'),
  StatusCode('201', 'Created', 'Successful', ' request succeeded, and a new resource was created as a result'),
  StatusCode('202', 'Accepted', 'Successful', 'request has been received but not yet acted upon'),
  StatusCode('204', 'No Content', 'Successful', 'server successfully processed the request, and is not returning any content'),
  StatusCode('300', 'Multiple Choices', 'Redirection', ''),
  StatusCode('301', 'Moved Permanently', 'Redirection', ''),
  StatusCode('400', 'Bad Request', 'Client Errors', ''),
  StatusCode('401', 'Unauthorized', 'Client Errors', ''),
  StatusCode('403', 'Forbidden', 'Client Errors', ''),
  StatusCode('404', 'Not Found', 'Client Errors', ''),
  StatusCode('405', 'Method Not Allowed', 'Client Errors', ''),
  StatusCode('500', 'Internal Server Error', 'Server Errors', ''),
  StatusCode('502', 'Bad Gateway', 'Server Errors', ''),
];