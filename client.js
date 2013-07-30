/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements. See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership. The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
var thrift = require('thrift');

var http = require('http');

var AdvertiserService = require('./gen-nodejs/AdvertiserService.js'),
    ttypes = require('./gen-nodejs/AdvertiserService_types.js'),
    ttransport = require('./node_modules/thrift/lib/thrift/transport'),
    tprotocol = require('./node_modules/thrift/lib/thrift/protocol.js');

var AdvertiserModel_ttypes = require('./gen-nodejs/AdvertiserModel_types')


var connection = thrift.createConnection('10.14.110.10', 8080, {transport:ttransport.TBufferedTransport,  protocol: tprotocol.TBinaryProtocol});



connection.on('error', function(err) {
  console.error(err);
});

connection.on('close', function(err) {
    console.error(err);
});

var userContext =  new AdvertiserModel_ttypes.AdvReadContext({
    accountId:'4028cb8b2b18b3ca012b18b750de0001',
    userId:'anshul.garg@inmobi.com'
})

connection.on('connect', function() {
    var client = thrift.createClient(AdvertiserService,connection);
    console.log("client",client);
    client.getAdGroup('55d3d05ce6db4dc8b3bbf97e4e973a56', userContext, function(err,data){
        if (err) {
            console.log('gettablenames error:', err);
        } else {
            console.log('hbase tables:', data);
        }
        connection.end();
    });
    /*
    client.getAdGroup('55d3d05ce6db4dc8b3bbf97e4e973a56', userContext, function(err,data) {
        if (err) {
            console.log('gettablenames error:', err);
        } else {
            console.log('hbase tables:', data);
        }
        connection.end();
    });
    */
})





/*
client.getAdGroup('55d3d05ce6db4dc8b3bbf97e4e973a56', new AdvertiserModel_ttypes.AdvWriteContext(), function(err, response){
    if(err){
        throw err;
    }else{
        console.log(response);
    }
})

    */