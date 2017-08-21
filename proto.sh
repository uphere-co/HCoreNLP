hprotoc -I proto -p CoreNLP.Proto --lens HCoreNLP.proto
protoc -I=proto --java_out=javasrc proto/HCoreNLP.proto
