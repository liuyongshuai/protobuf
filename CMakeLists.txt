CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
PROJECT(protobuf)
SET(project_name "protobuf")


#set(CMAKE_CXX_STANDARD 17)
SET(CMAKE_CXX_FLAGS "-gdwarf-2 -std=c++11 -DHAVE_PTHREAD -pipe -fno-omit-frame-pointer -fPIC -D_GLIBCXX_USE_CXX11_ABI=0")

# work home
SET(WORK_HOME ${CMAKE_CURRENT_SOURCE_DIR})

#include list
INCLUDE_DIRECTORIES(${WORK_HOME})


SET(SRC_SOURCE_LIST
        ${WORK_HOME}/google/protobuf/any.cc
        ${WORK_HOME}/google/protobuf/stubs/int128.cc
        ${WORK_HOME}/google/protobuf/stubs/structurally_valid.cc
        ${WORK_HOME}/google/protobuf/stubs/status.cc
        ${WORK_HOME}/google/protobuf/stubs/common.cc
        ${WORK_HOME}/google/protobuf/stubs/bytestream.cc
        ${WORK_HOME}/google/protobuf/stubs/statusor.cc
        ${WORK_HOME}/google/protobuf/stubs/strutil.cc
        ${WORK_HOME}/google/protobuf/stubs/stringprintf.cc
        ${WORK_HOME}/google/protobuf/stubs/time.cc
        ${WORK_HOME}/google/protobuf/stubs/substitute.cc
        ${WORK_HOME}/google/protobuf/stubs/stringpiece.cc
        ${WORK_HOME}/google/protobuf/descriptor.pb.cc
        ${WORK_HOME}/google/protobuf/generated_message_table_driven_lite.cc
        ${WORK_HOME}/google/protobuf/any_lite.cc
        ${WORK_HOME}/google/protobuf/descriptor_database.cc
        ${WORK_HOME}/google/protobuf/reflection_ops.cc
        ${WORK_HOME}/google/protobuf/arena.cc
        ${WORK_HOME}/google/protobuf/util/time_util.cc
        ${WORK_HOME}/google/protobuf/util/field_mask_util.cc
        ${WORK_HOME}/google/protobuf/util/delimited_message_util.cc
        ${WORK_HOME}/google/protobuf/util/field_comparator.cc
        ${WORK_HOME}/google/protobuf/util/message_differencer.cc
        ${WORK_HOME}/google/protobuf/util/json_util.cc
        ${WORK_HOME}/google/protobuf/util/internal/protostream_objectsource.cc
        ${WORK_HOME}/google/protobuf/util/internal/field_mask_utility.cc
        ${WORK_HOME}/google/protobuf/util/internal/object_writer.cc
        ${WORK_HOME}/google/protobuf/util/internal/json_stream_parser.cc
        ${WORK_HOME}/google/protobuf/util/internal/protostream_objectwriter.cc
        ${WORK_HOME}/google/protobuf/util/internal/proto_writer.cc
        ${WORK_HOME}/google/protobuf/util/internal/utility.cc
        ${WORK_HOME}/google/protobuf/util/internal/json_objectwriter.cc
        ${WORK_HOME}/google/protobuf/util/internal/error_listener.cc
        ${WORK_HOME}/google/protobuf/util/internal/type_info_test_helper.cc
        ${WORK_HOME}/google/protobuf/util/internal/datapiece.cc
        ${WORK_HOME}/google/protobuf/util/internal/default_value_objectwriter.cc
        ${WORK_HOME}/google/protobuf/util/internal/type_info.cc
        ${WORK_HOME}/google/protobuf/util/internal/json_escaping.cc
        ${WORK_HOME}/google/protobuf/util/type_resolver_util.cc
        ${WORK_HOME}/google/protobuf/type.pb.cc
        ${WORK_HOME}/google/protobuf/arena_test_util.cc
        ${WORK_HOME}/google/protobuf/empty.pb.cc
        ${WORK_HOME}/google/protobuf/extension_set_heavy.cc
        ${WORK_HOME}/google/protobuf/message_lite.cc
        ${WORK_HOME}/google/protobuf/io/zero_copy_stream_impl_lite.cc
        ${WORK_HOME}/google/protobuf/io/zero_copy_stream_impl.cc
        ${WORK_HOME}/google/protobuf/io/coded_stream.cc
        ${WORK_HOME}/google/protobuf/io/printer.cc
        ${WORK_HOME}/google/protobuf/io/tokenizer.cc
        ${WORK_HOME}/google/protobuf/io/gzip_stream.cc
        ${WORK_HOME}/google/protobuf/io/zero_copy_stream.cc
        ${WORK_HOME}/google/protobuf/io/strtod.cc
        ${WORK_HOME}/google/protobuf/io/io_win32.cc
        ${WORK_HOME}/google/protobuf/wire_format_lite.cc
        ${WORK_HOME}/google/protobuf/parse_context.cc
        ${WORK_HOME}/google/protobuf/source_context.pb.cc
        ${WORK_HOME}/google/protobuf/wrappers.pb.cc
        ${WORK_HOME}/google/protobuf/unknown_field_set.cc
        ${WORK_HOME}/google/protobuf/any.pb.cc
        ${WORK_HOME}/google/protobuf/repeated_field.cc
        ${WORK_HOME}/google/protobuf/generated_message_reflection.cc
        ${WORK_HOME}/google/protobuf/implicit_weak_message.cc
        ${WORK_HOME}/google/protobuf/duration.pb.cc
        ${WORK_HOME}/google/protobuf/struct.pb.cc
        ${WORK_HOME}/google/protobuf/generated_message_util.cc
        ${WORK_HOME}/google/protobuf/api.pb.cc
        ${WORK_HOME}/google/protobuf/message.cc
        ${WORK_HOME}/google/protobuf/service.cc
        ${WORK_HOME}/google/protobuf/descriptor.cc
        ${WORK_HOME}/google/protobuf/wire_format.cc
        ${WORK_HOME}/google/protobuf/dynamic_message.cc
        ${WORK_HOME}/google/protobuf/map_field.cc
        ${WORK_HOME}/google/protobuf/compiler/command_line_interface.cc
        ${WORK_HOME}/google/protobuf/compiler/code_generator.cc
        ${WORK_HOME}/google/protobuf/compiler/zip_writer.cc
        ${WORK_HOME}/google/protobuf/compiler/parser.cc
        ${WORK_HOME}/google/protobuf/compiler/plugin.cc
        ${WORK_HOME}/google/protobuf/compiler/subprocess.cc
        ${WORK_HOME}/google/protobuf/compiler/plugin.pb.cc
        ${WORK_HOME}/google/protobuf/compiler/cpp/cpp_extension.cc
        ${WORK_HOME}/google/protobuf/compiler/cpp/cpp_message.cc
        ${WORK_HOME}/google/protobuf/compiler/cpp/cpp_generator.cc
        ${WORK_HOME}/google/protobuf/compiler/cpp/cpp_enum_field.cc
        ${WORK_HOME}/google/protobuf/compiler/cpp/cpp_service.cc
        ${WORK_HOME}/google/protobuf/compiler/cpp/cpp_message_field.cc
        ${WORK_HOME}/google/protobuf/compiler/cpp/cpp_map_field.cc
        ${WORK_HOME}/google/protobuf/compiler/cpp/cpp_file.cc
        ${WORK_HOME}/google/protobuf/compiler/cpp/cpp_string_field.cc
        ${WORK_HOME}/google/protobuf/compiler/cpp/cpp_helpers.cc
        ${WORK_HOME}/google/protobuf/compiler/cpp/cpp_field.cc
        ${WORK_HOME}/google/protobuf/compiler/cpp/cpp_primitive_field.cc
        ${WORK_HOME}/google/protobuf/compiler/cpp/cpp_enum.cc
        ${WORK_HOME}/google/protobuf/compiler/cpp/cpp_padding_optimizer.cc
        ${WORK_HOME}/google/protobuf/compiler/importer.cc
        ${WORK_HOME}/google/protobuf/field_mask.pb.cc
        ${WORK_HOME}/google/protobuf/timestamp.pb.cc
        ${WORK_HOME}/google/protobuf/text_format.cc
        ${WORK_HOME}/google/protobuf/extension_set.cc
        ${WORK_HOME}/google/protobuf/generated_enum_util.cc
        ${WORK_HOME}/google/protobuf/generated_message_table_driven.cc
        )


ADD_EXECUTABLE("protoc" ${WORK_HOME}/protoc.cc ${SRC_SOURCE_LIST})
INSTALL(TARGETS "protoc" DESTINATION ${WORK_HOME}/output/)

