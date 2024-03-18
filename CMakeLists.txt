CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
PROJECT(bagutils)
SET(project_name "bagutils")

##============= 确定编译选项 =============
OPTION(TARGET_DEBUG_MODE "Build the project with debug mode" OFF)
#set(CMAKE_CXX_STANDARD 17)
SET(CMAKE_CXX_FLAGS "-gdwarf-2 -std=c++11 -pipe -fno-omit-frame-pointer -fPIC -D_GLIBCXX_USE_CXX11_ABI=0 -DSPDLOG_FMT_PRINTF -D__FILENAME__='\"$(notdir $<)\"'")
if (TARGET_DEBUG_MODE)
    SET(CMAKE_BUILD_TYPE "Debug")
    MESSAGE("debug")
    SET(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS} -W -Wall -O0 -g -ftest-coverage -fprofile-arcs -D__DEBUG_MODE__ -DLOG_DEBUG_ENABLE=true")
else (TARGET_DEBUG_MODE)
    SET(CMAKE_BUILD_TYPE "Release")
    SET(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS} -DNDEBUG -O2 -DLOG_DEBUG_ENABLE=false")
    MESSAGE("not debug")
endif (TARGET_DEBUG_MODE)

# work home
SET(WORK_HOME ${CMAKE_CURRENT_SOURCE_DIR})

#include list
SET(include_list "")
LIST(APPEND include_list ${SRC_HOME})

#引入其他文件
SET(SRC_SOURCE_LIST
        ${SRC_HOME}/google/protobuf/any.cc
        ${SRC_HOME}/google/protobuf/stubs/int128.cc
        ${SRC_HOME}/google/protobuf/stubs/structurally_valid.cc
        ${SRC_HOME}/google/protobuf/stubs/status.cc
        ${SRC_HOME}/google/protobuf/stubs/time_test.cc
        ${SRC_HOME}/google/protobuf/stubs/common.cc
        ${SRC_HOME}/google/protobuf/stubs/bytestream.cc
        ${SRC_HOME}/google/protobuf/stubs/statusor.cc
        ${SRC_HOME}/google/protobuf/stubs/strutil.cc
        ${SRC_HOME}/google/protobuf/stubs/status_test.cc
        ${SRC_HOME}/google/protobuf/stubs/statusor_test.cc
        ${SRC_HOME}/google/protobuf/stubs/stringprintf.cc
        ${SRC_HOME}/google/protobuf/stubs/time.cc
        ${SRC_HOME}/google/protobuf/stubs/substitute.cc
        ${SRC_HOME}/google/protobuf/stubs/stringpiece.cc
        ${SRC_HOME}/google/protobuf/descriptor.pb.cc
        ${SRC_HOME}/google/protobuf/generated_message_table_driven_lite.cc
        ${SRC_HOME}/google/protobuf/any_lite.cc
        ${SRC_HOME}/google/protobuf/descriptor_database.cc
        ${SRC_HOME}/google/protobuf/no_field_presence_test.cc
        ${SRC_HOME}/google/protobuf/reflection_ops.cc
        ${SRC_HOME}/google/protobuf/arena.cc
        ${SRC_HOME}/google/protobuf/util/time_util.cc
        ${SRC_HOME}/google/protobuf/util/field_mask_util.cc
        ${SRC_HOME}/google/protobuf/util/delimited_message_util.cc
        ${SRC_HOME}/google/protobuf/util/field_mask_util_test.cc
        ${SRC_HOME}/google/protobuf/util/field_comparator.cc
        ${SRC_HOME}/google/protobuf/util/message_differencer.cc
        ${SRC_HOME}/google/protobuf/util/json_util.cc
        ${SRC_HOME}/google/protobuf/util/time_util_test.cc
        ${SRC_HOME}/google/protobuf/util/internal/protostream_objectsource.cc
        ${SRC_HOME}/google/protobuf/util/internal/default_value_objectwriter_test.cc
        ${SRC_HOME}/google/protobuf/util/internal/field_mask_utility.cc
        ${SRC_HOME}/google/protobuf/util/internal/protostream_objectsource_test.cc
        ${SRC_HOME}/google/protobuf/util/internal/object_writer.cc
        ${SRC_HOME}/google/protobuf/util/internal/json_stream_parser_test.cc
        ${SRC_HOME}/google/protobuf/util/internal/json_stream_parser.cc
        ${SRC_HOME}/google/protobuf/util/internal/protostream_objectwriter_test.cc
        ${SRC_HOME}/google/protobuf/util/internal/protostream_objectwriter.cc
        ${SRC_HOME}/google/protobuf/util/internal/proto_writer.cc
        ${SRC_HOME}/google/protobuf/util/internal/utility.cc
        ${SRC_HOME}/google/protobuf/util/internal/json_objectwriter.cc
        ${SRC_HOME}/google/protobuf/util/internal/error_listener.cc
        ${SRC_HOME}/google/protobuf/util/internal/json_objectwriter_test.cc
        ${SRC_HOME}/google/protobuf/util/internal/type_info_test_helper.cc
        ${SRC_HOME}/google/protobuf/util/internal/datapiece.cc
        ${SRC_HOME}/google/protobuf/util/internal/default_value_objectwriter.cc
        ${SRC_HOME}/google/protobuf/util/internal/type_info.cc
        ${SRC_HOME}/google/protobuf/util/internal/json_escaping.cc
        ${SRC_HOME}/google/protobuf/util/delimited_message_util_test.cc
        ${SRC_HOME}/google/protobuf/util/field_comparator_test.cc
        ${SRC_HOME}/google/protobuf/util/json_util_test.cc
        ${SRC_HOME}/google/protobuf/util/type_resolver_util.cc
        ${SRC_HOME}/google/protobuf/util/type_resolver_util_test.cc
        ${SRC_HOME}/google/protobuf/type.pb.cc
        ${SRC_HOME}/google/protobuf/arena_test_util.cc
        ${SRC_HOME}/google/protobuf/empty.pb.cc
        ${SRC_HOME}/google/protobuf/extension_set_heavy.cc
        ${SRC_HOME}/google/protobuf/map_test.cc
        ${SRC_HOME}/google/protobuf/message_lite.cc
        ${SRC_HOME}/google/protobuf/io/zero_copy_stream_impl_lite.cc
        ${SRC_HOME}/google/protobuf/io/zero_copy_stream_impl.cc
        ${SRC_HOME}/google/protobuf/io/coded_stream.cc
        ${SRC_HOME}/google/protobuf/io/printer.cc
        ${SRC_HOME}/google/protobuf/io/tokenizer.cc
        ${SRC_HOME}/google/protobuf/io/gzip_stream.cc
        ${SRC_HOME}/google/protobuf/io/zero_copy_stream.cc
        ${SRC_HOME}/google/protobuf/io/strtod.cc
        ${SRC_HOME}/google/protobuf/io/io_win32.cc
        ${SRC_HOME}/google/protobuf/wire_format_lite.cc
        ${SRC_HOME}/google/protobuf/parse_context.cc
        ${SRC_HOME}/google/protobuf/source_context.pb.cc
        ${SRC_HOME}/google/protobuf/wrappers.pb.cc
        ${SRC_HOME}/google/protobuf/unknown_field_set.cc
        ${SRC_HOME}/google/protobuf/any.pb.cc
        ${SRC_HOME}/google/protobuf/repeated_field.cc
        ${SRC_HOME}/google/protobuf/generated_message_reflection.cc
        ${SRC_HOME}/google/protobuf/implicit_weak_message.cc
        ${SRC_HOME}/google/protobuf/duration.pb.cc
        ${SRC_HOME}/google/protobuf/struct.pb.cc
        ${SRC_HOME}/google/protobuf/testing/file.cc
        ${SRC_HOME}/google/protobuf/testing/googletest.cc
        ${SRC_HOME}/google/protobuf/preserve_unknown_enum_test.cc
        ${SRC_HOME}/google/protobuf/test_util.cc
        ${SRC_HOME}/google/protobuf/generated_message_util.cc
        ${SRC_HOME}/google/protobuf/api.pb.cc
        ${SRC_HOME}/google/protobuf/message.cc
        ${SRC_HOME}/google/protobuf/map_lite_test_util.cc
        ${SRC_HOME}/google/protobuf/test_util_lite.cc
        ${SRC_HOME}/google/protobuf/map_field_test.cc
        ${SRC_HOME}/google/protobuf/service.cc
        ${SRC_HOME}/google/protobuf/any_test.cc
        ${SRC_HOME}/google/protobuf/descriptor.cc
        ${SRC_HOME}/google/protobuf/wire_format.cc
        ${SRC_HOME}/google/protobuf/dynamic_message.cc
        ${SRC_HOME}/google/protobuf/drop_unknown_fields_test.cc
        ${SRC_HOME}/google/protobuf/map_field.cc
        ${SRC_HOME}/google/protobuf/compiler/command_line_interface.cc
        ${SRC_HOME}/google/protobuf/compiler/code_generator.cc
        ${SRC_HOME}/google/protobuf/compiler/annotation_test_util.cc
        ${SRC_HOME}/google/protobuf/compiler/zip_writer.cc
        ${SRC_HOME}/google/protobuf/compiler/parser.cc
        ${SRC_HOME}/google/protobuf/compiler/plugin.cc
        ${SRC_HOME}/google/protobuf/compiler/subprocess.cc
        ${SRC_HOME}/google/protobuf/compiler/plugin.pb.cc
        ${SRC_HOME}/google/protobuf/compiler/mock_code_generator.cc
        ${SRC_HOME}/google/protobuf/compiler/cpp/cpp_extension.cc
        ${SRC_HOME}/google/protobuf/compiler/cpp/cpp_message.cc
        ${SRC_HOME}/google/protobuf/compiler/cpp/metadata_test.cc
        ${SRC_HOME}/google/protobuf/compiler/cpp/cpp_generator.cc
        ${SRC_HOME}/google/protobuf/compiler/cpp/cpp_enum_field.cc
        ${SRC_HOME}/google/protobuf/compiler/cpp/cpp_service.cc
        ${SRC_HOME}/google/protobuf/compiler/cpp/cpp_message_field.cc
        ${SRC_HOME}/google/protobuf/compiler/cpp/cpp_map_field.cc
        ${SRC_HOME}/google/protobuf/compiler/cpp/cpp_file.cc
        ${SRC_HOME}/google/protobuf/compiler/cpp/cpp_string_field.cc
        ${SRC_HOME}/google/protobuf/compiler/cpp/cpp_helpers.cc
        ${SRC_HOME}/google/protobuf/compiler/cpp/cpp_field.cc
        ${SRC_HOME}/google/protobuf/compiler/cpp/cpp_primitive_field.cc
        ${SRC_HOME}/google/protobuf/compiler/cpp/cpp_enum.cc
        ${SRC_HOME}/google/protobuf/compiler/cpp/cpp_padding_optimizer.cc
        ${SRC_HOME}/google/protobuf/compiler/test_plugin.cc
        ${SRC_HOME}/google/protobuf/compiler/importer.cc
        ${SRC_HOME}/google/protobuf/field_mask.pb.cc
        ${SRC_HOME}/google/protobuf/timestamp.pb.cc
        ${SRC_HOME}/google/protobuf/text_format.cc
        ${SRC_HOME}/google/protobuf/extension_set.cc
        ${SRC_HOME}/google/protobuf/generated_enum_util.cc
        ${SRC_HOME}/google/protobuf/generated_message_table_driven.cc
        )


ADD_EXECUTABLE("protoc" ${SRC_HOME}/google/protobuf/compiler/main.cc ${SRC_SOURCE_LIST})
INSTALL(TARGETS ${target} DESTINATION ${WORK_HOME}/output/)

