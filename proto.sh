hprotoc -I ../proto -p CoreNLP HCoreNLP.proto
protoc -I=../proto --java_out=javasrc ../proto/HCoreNLP.proto
