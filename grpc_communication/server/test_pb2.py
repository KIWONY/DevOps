# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: test.proto
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import descriptor_pool as _descriptor_pool
from google.protobuf import symbol_database as _symbol_database
from google.protobuf.internal import builder as _builder
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor_pool.Default().AddSerializedFile(b'\n\ntest.proto\x12\ttestworld\"&\n\x0bTestRequest\x12\x17\n\x0frequest_message\x18\x01 \x01(\t\"%\n\tTestReply\x12\x18\n\x10response_message\x18\x01 \x01(\t2B\n\x08TestGrpc\x12\x36\n\x04Test\x12\x16.testworld.TestRequest\x1a\x14.testworld.TestReply\"\x00\x62\x06proto3')

_globals = globals()
_builder.BuildMessageAndEnumDescriptors(DESCRIPTOR, _globals)
_builder.BuildTopDescriptorsAndMessages(DESCRIPTOR, 'test_pb2', _globals)
if _descriptor._USE_C_DESCRIPTORS == False:

  DESCRIPTOR._options = None
  _globals['_TESTREQUEST']._serialized_start=25
  _globals['_TESTREQUEST']._serialized_end=63
  _globals['_TESTREPLY']._serialized_start=65
  _globals['_TESTREPLY']._serialized_end=102
  _globals['_TESTGRPC']._serialized_start=104
  _globals['_TESTGRPC']._serialized_end=170
# @@protoc_insertion_point(module_scope)
