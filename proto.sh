hprotoc -I proto -p CoreNLP --lens HCoreNLP.proto
protoc -I=proto --java_out=javasrc proto/HCoreNLP.proto
