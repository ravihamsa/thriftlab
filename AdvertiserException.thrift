namespace java com.inmobi.advertiser.service.thrift.exception

struct Error {
        1: required i32 code,
        2: optional string message,
        3: optional list<string> arguments      
}

exception ServiceException {
	1: optional list<Error> errors
}

exception InternalServerError {
}

exception NoDataFoundException {
}