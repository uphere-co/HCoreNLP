// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: HCoreNLP.proto

package ai.uphere.HCoreNLP;

public final class HCoreNLPProto {
  private HCoreNLPProto() {}
  public static void registerAllExtensions(
      com.google.protobuf.ExtensionRegistry registry) {
  }
  public interface ListTimexOrBuilder extends
      // @@protoc_insertion_point(interface_extends:ai.uphere.HCoreNLP.ListTimex)
      com.google.protobuf.MessageOrBuilder {

    /**
     * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
     */
    java.util.List<edu.stanford.nlp.pipeline.CoreNLPProtos.Timex> 
        getTimexesList();
    /**
     * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
     */
    edu.stanford.nlp.pipeline.CoreNLPProtos.Timex getTimexes(int index);
    /**
     * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
     */
    int getTimexesCount();
    /**
     * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
     */
    java.util.List<? extends edu.stanford.nlp.pipeline.CoreNLPProtos.TimexOrBuilder> 
        getTimexesOrBuilderList();
    /**
     * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
     */
    edu.stanford.nlp.pipeline.CoreNLPProtos.TimexOrBuilder getTimexesOrBuilder(
        int index);
  }
  /**
   * Protobuf type {@code ai.uphere.HCoreNLP.ListTimex}
   *
   * <pre>
   * List of Timex
   * </pre>
   */
  public static final class ListTimex extends
      com.google.protobuf.GeneratedMessage implements
      // @@protoc_insertion_point(message_implements:ai.uphere.HCoreNLP.ListTimex)
      ListTimexOrBuilder {
    // Use ListTimex.newBuilder() to construct.
    private ListTimex(com.google.protobuf.GeneratedMessage.Builder<?> builder) {
      super(builder);
      this.unknownFields = builder.getUnknownFields();
    }
    private ListTimex(boolean noInit) { this.unknownFields = com.google.protobuf.UnknownFieldSet.getDefaultInstance(); }

    private static final ListTimex defaultInstance;
    public static ListTimex getDefaultInstance() {
      return defaultInstance;
    }

    public ListTimex getDefaultInstanceForType() {
      return defaultInstance;
    }

    private final com.google.protobuf.UnknownFieldSet unknownFields;
    @java.lang.Override
    public final com.google.protobuf.UnknownFieldSet
        getUnknownFields() {
      return this.unknownFields;
    }
    private ListTimex(
        com.google.protobuf.CodedInputStream input,
        com.google.protobuf.ExtensionRegistryLite extensionRegistry)
        throws com.google.protobuf.InvalidProtocolBufferException {
      initFields();
      int mutable_bitField0_ = 0;
      com.google.protobuf.UnknownFieldSet.Builder unknownFields =
          com.google.protobuf.UnknownFieldSet.newBuilder();
      try {
        boolean done = false;
        while (!done) {
          int tag = input.readTag();
          switch (tag) {
            case 0:
              done = true;
              break;
            default: {
              if (!parseUnknownField(input, unknownFields,
                                     extensionRegistry, tag)) {
                done = true;
              }
              break;
            }
            case 10: {
              if (!((mutable_bitField0_ & 0x00000001) == 0x00000001)) {
                timexes_ = new java.util.ArrayList<edu.stanford.nlp.pipeline.CoreNLPProtos.Timex>();
                mutable_bitField0_ |= 0x00000001;
              }
              timexes_.add(input.readMessage(edu.stanford.nlp.pipeline.CoreNLPProtos.Timex.PARSER, extensionRegistry));
              break;
            }
          }
        }
      } catch (com.google.protobuf.InvalidProtocolBufferException e) {
        throw e.setUnfinishedMessage(this);
      } catch (java.io.IOException e) {
        throw new com.google.protobuf.InvalidProtocolBufferException(
            e.getMessage()).setUnfinishedMessage(this);
      } finally {
        if (((mutable_bitField0_ & 0x00000001) == 0x00000001)) {
          timexes_ = java.util.Collections.unmodifiableList(timexes_);
        }
        this.unknownFields = unknownFields.build();
        makeExtensionsImmutable();
      }
    }
    public static final com.google.protobuf.Descriptors.Descriptor
        getDescriptor() {
      return ai.uphere.HCoreNLP.HCoreNLPProto.internal_static_ai_uphere_HCoreNLP_ListTimex_descriptor;
    }

    protected com.google.protobuf.GeneratedMessage.FieldAccessorTable
        internalGetFieldAccessorTable() {
      return ai.uphere.HCoreNLP.HCoreNLPProto.internal_static_ai_uphere_HCoreNLP_ListTimex_fieldAccessorTable
          .ensureFieldAccessorsInitialized(
              ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex.class, ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex.Builder.class);
    }

    public static com.google.protobuf.Parser<ListTimex> PARSER =
        new com.google.protobuf.AbstractParser<ListTimex>() {
      public ListTimex parsePartialFrom(
          com.google.protobuf.CodedInputStream input,
          com.google.protobuf.ExtensionRegistryLite extensionRegistry)
          throws com.google.protobuf.InvalidProtocolBufferException {
        return new ListTimex(input, extensionRegistry);
      }
    };

    @java.lang.Override
    public com.google.protobuf.Parser<ListTimex> getParserForType() {
      return PARSER;
    }

    public static final int TIMEXES_FIELD_NUMBER = 1;
    private java.util.List<edu.stanford.nlp.pipeline.CoreNLPProtos.Timex> timexes_;
    /**
     * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
     */
    public java.util.List<edu.stanford.nlp.pipeline.CoreNLPProtos.Timex> getTimexesList() {
      return timexes_;
    }
    /**
     * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
     */
    public java.util.List<? extends edu.stanford.nlp.pipeline.CoreNLPProtos.TimexOrBuilder> 
        getTimexesOrBuilderList() {
      return timexes_;
    }
    /**
     * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
     */
    public int getTimexesCount() {
      return timexes_.size();
    }
    /**
     * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
     */
    public edu.stanford.nlp.pipeline.CoreNLPProtos.Timex getTimexes(int index) {
      return timexes_.get(index);
    }
    /**
     * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
     */
    public edu.stanford.nlp.pipeline.CoreNLPProtos.TimexOrBuilder getTimexesOrBuilder(
        int index) {
      return timexes_.get(index);
    }

    private void initFields() {
      timexes_ = java.util.Collections.emptyList();
    }
    private byte memoizedIsInitialized = -1;
    public final boolean isInitialized() {
      byte isInitialized = memoizedIsInitialized;
      if (isInitialized == 1) return true;
      if (isInitialized == 0) return false;

      memoizedIsInitialized = 1;
      return true;
    }

    public void writeTo(com.google.protobuf.CodedOutputStream output)
                        throws java.io.IOException {
      getSerializedSize();
      for (int i = 0; i < timexes_.size(); i++) {
        output.writeMessage(1, timexes_.get(i));
      }
      getUnknownFields().writeTo(output);
    }

    private int memoizedSerializedSize = -1;
    public int getSerializedSize() {
      int size = memoizedSerializedSize;
      if (size != -1) return size;

      size = 0;
      for (int i = 0; i < timexes_.size(); i++) {
        size += com.google.protobuf.CodedOutputStream
          .computeMessageSize(1, timexes_.get(i));
      }
      size += getUnknownFields().getSerializedSize();
      memoizedSerializedSize = size;
      return size;
    }

    private static final long serialVersionUID = 0L;
    @java.lang.Override
    protected java.lang.Object writeReplace()
        throws java.io.ObjectStreamException {
      return super.writeReplace();
    }

    public static ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex parseFrom(
        com.google.protobuf.ByteString data)
        throws com.google.protobuf.InvalidProtocolBufferException {
      return PARSER.parseFrom(data);
    }
    public static ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex parseFrom(
        com.google.protobuf.ByteString data,
        com.google.protobuf.ExtensionRegistryLite extensionRegistry)
        throws com.google.protobuf.InvalidProtocolBufferException {
      return PARSER.parseFrom(data, extensionRegistry);
    }
    public static ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex parseFrom(byte[] data)
        throws com.google.protobuf.InvalidProtocolBufferException {
      return PARSER.parseFrom(data);
    }
    public static ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex parseFrom(
        byte[] data,
        com.google.protobuf.ExtensionRegistryLite extensionRegistry)
        throws com.google.protobuf.InvalidProtocolBufferException {
      return PARSER.parseFrom(data, extensionRegistry);
    }
    public static ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex parseFrom(java.io.InputStream input)
        throws java.io.IOException {
      return PARSER.parseFrom(input);
    }
    public static ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex parseFrom(
        java.io.InputStream input,
        com.google.protobuf.ExtensionRegistryLite extensionRegistry)
        throws java.io.IOException {
      return PARSER.parseFrom(input, extensionRegistry);
    }
    public static ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex parseDelimitedFrom(java.io.InputStream input)
        throws java.io.IOException {
      return PARSER.parseDelimitedFrom(input);
    }
    public static ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex parseDelimitedFrom(
        java.io.InputStream input,
        com.google.protobuf.ExtensionRegistryLite extensionRegistry)
        throws java.io.IOException {
      return PARSER.parseDelimitedFrom(input, extensionRegistry);
    }
    public static ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex parseFrom(
        com.google.protobuf.CodedInputStream input)
        throws java.io.IOException {
      return PARSER.parseFrom(input);
    }
    public static ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex parseFrom(
        com.google.protobuf.CodedInputStream input,
        com.google.protobuf.ExtensionRegistryLite extensionRegistry)
        throws java.io.IOException {
      return PARSER.parseFrom(input, extensionRegistry);
    }

    public static Builder newBuilder() { return Builder.create(); }
    public Builder newBuilderForType() { return newBuilder(); }
    public static Builder newBuilder(ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex prototype) {
      return newBuilder().mergeFrom(prototype);
    }
    public Builder toBuilder() { return newBuilder(this); }

    @java.lang.Override
    protected Builder newBuilderForType(
        com.google.protobuf.GeneratedMessage.BuilderParent parent) {
      Builder builder = new Builder(parent);
      return builder;
    }
    /**
     * Protobuf type {@code ai.uphere.HCoreNLP.ListTimex}
     *
     * <pre>
     * List of Timex
     * </pre>
     */
    public static final class Builder extends
        com.google.protobuf.GeneratedMessage.Builder<Builder> implements
        // @@protoc_insertion_point(builder_implements:ai.uphere.HCoreNLP.ListTimex)
        ai.uphere.HCoreNLP.HCoreNLPProto.ListTimexOrBuilder {
      public static final com.google.protobuf.Descriptors.Descriptor
          getDescriptor() {
        return ai.uphere.HCoreNLP.HCoreNLPProto.internal_static_ai_uphere_HCoreNLP_ListTimex_descriptor;
      }

      protected com.google.protobuf.GeneratedMessage.FieldAccessorTable
          internalGetFieldAccessorTable() {
        return ai.uphere.HCoreNLP.HCoreNLPProto.internal_static_ai_uphere_HCoreNLP_ListTimex_fieldAccessorTable
            .ensureFieldAccessorsInitialized(
                ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex.class, ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex.Builder.class);
      }

      // Construct using ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex.newBuilder()
      private Builder() {
        maybeForceBuilderInitialization();
      }

      private Builder(
          com.google.protobuf.GeneratedMessage.BuilderParent parent) {
        super(parent);
        maybeForceBuilderInitialization();
      }
      private void maybeForceBuilderInitialization() {
        if (com.google.protobuf.GeneratedMessage.alwaysUseFieldBuilders) {
          getTimexesFieldBuilder();
        }
      }
      private static Builder create() {
        return new Builder();
      }

      public Builder clear() {
        super.clear();
        if (timexesBuilder_ == null) {
          timexes_ = java.util.Collections.emptyList();
          bitField0_ = (bitField0_ & ~0x00000001);
        } else {
          timexesBuilder_.clear();
        }
        return this;
      }

      public Builder clone() {
        return create().mergeFrom(buildPartial());
      }

      public com.google.protobuf.Descriptors.Descriptor
          getDescriptorForType() {
        return ai.uphere.HCoreNLP.HCoreNLPProto.internal_static_ai_uphere_HCoreNLP_ListTimex_descriptor;
      }

      public ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex getDefaultInstanceForType() {
        return ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex.getDefaultInstance();
      }

      public ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex build() {
        ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex result = buildPartial();
        if (!result.isInitialized()) {
          throw newUninitializedMessageException(result);
        }
        return result;
      }

      public ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex buildPartial() {
        ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex result = new ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex(this);
        int from_bitField0_ = bitField0_;
        if (timexesBuilder_ == null) {
          if (((bitField0_ & 0x00000001) == 0x00000001)) {
            timexes_ = java.util.Collections.unmodifiableList(timexes_);
            bitField0_ = (bitField0_ & ~0x00000001);
          }
          result.timexes_ = timexes_;
        } else {
          result.timexes_ = timexesBuilder_.build();
        }
        onBuilt();
        return result;
      }

      public Builder mergeFrom(com.google.protobuf.Message other) {
        if (other instanceof ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex) {
          return mergeFrom((ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex)other);
        } else {
          super.mergeFrom(other);
          return this;
        }
      }

      public Builder mergeFrom(ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex other) {
        if (other == ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex.getDefaultInstance()) return this;
        if (timexesBuilder_ == null) {
          if (!other.timexes_.isEmpty()) {
            if (timexes_.isEmpty()) {
              timexes_ = other.timexes_;
              bitField0_ = (bitField0_ & ~0x00000001);
            } else {
              ensureTimexesIsMutable();
              timexes_.addAll(other.timexes_);
            }
            onChanged();
          }
        } else {
          if (!other.timexes_.isEmpty()) {
            if (timexesBuilder_.isEmpty()) {
              timexesBuilder_.dispose();
              timexesBuilder_ = null;
              timexes_ = other.timexes_;
              bitField0_ = (bitField0_ & ~0x00000001);
              timexesBuilder_ = 
                com.google.protobuf.GeneratedMessage.alwaysUseFieldBuilders ?
                   getTimexesFieldBuilder() : null;
            } else {
              timexesBuilder_.addAllMessages(other.timexes_);
            }
          }
        }
        this.mergeUnknownFields(other.getUnknownFields());
        return this;
      }

      public final boolean isInitialized() {
        return true;
      }

      public Builder mergeFrom(
          com.google.protobuf.CodedInputStream input,
          com.google.protobuf.ExtensionRegistryLite extensionRegistry)
          throws java.io.IOException {
        ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex parsedMessage = null;
        try {
          parsedMessage = PARSER.parsePartialFrom(input, extensionRegistry);
        } catch (com.google.protobuf.InvalidProtocolBufferException e) {
          parsedMessage = (ai.uphere.HCoreNLP.HCoreNLPProto.ListTimex) e.getUnfinishedMessage();
          throw e;
        } finally {
          if (parsedMessage != null) {
            mergeFrom(parsedMessage);
          }
        }
        return this;
      }
      private int bitField0_;

      private java.util.List<edu.stanford.nlp.pipeline.CoreNLPProtos.Timex> timexes_ =
        java.util.Collections.emptyList();
      private void ensureTimexesIsMutable() {
        if (!((bitField0_ & 0x00000001) == 0x00000001)) {
          timexes_ = new java.util.ArrayList<edu.stanford.nlp.pipeline.CoreNLPProtos.Timex>(timexes_);
          bitField0_ |= 0x00000001;
         }
      }

      private com.google.protobuf.RepeatedFieldBuilder<
          edu.stanford.nlp.pipeline.CoreNLPProtos.Timex, edu.stanford.nlp.pipeline.CoreNLPProtos.Timex.Builder, edu.stanford.nlp.pipeline.CoreNLPProtos.TimexOrBuilder> timexesBuilder_;

      /**
       * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
       */
      public java.util.List<edu.stanford.nlp.pipeline.CoreNLPProtos.Timex> getTimexesList() {
        if (timexesBuilder_ == null) {
          return java.util.Collections.unmodifiableList(timexes_);
        } else {
          return timexesBuilder_.getMessageList();
        }
      }
      /**
       * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
       */
      public int getTimexesCount() {
        if (timexesBuilder_ == null) {
          return timexes_.size();
        } else {
          return timexesBuilder_.getCount();
        }
      }
      /**
       * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
       */
      public edu.stanford.nlp.pipeline.CoreNLPProtos.Timex getTimexes(int index) {
        if (timexesBuilder_ == null) {
          return timexes_.get(index);
        } else {
          return timexesBuilder_.getMessage(index);
        }
      }
      /**
       * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
       */
      public Builder setTimexes(
          int index, edu.stanford.nlp.pipeline.CoreNLPProtos.Timex value) {
        if (timexesBuilder_ == null) {
          if (value == null) {
            throw new NullPointerException();
          }
          ensureTimexesIsMutable();
          timexes_.set(index, value);
          onChanged();
        } else {
          timexesBuilder_.setMessage(index, value);
        }
        return this;
      }
      /**
       * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
       */
      public Builder setTimexes(
          int index, edu.stanford.nlp.pipeline.CoreNLPProtos.Timex.Builder builderForValue) {
        if (timexesBuilder_ == null) {
          ensureTimexesIsMutable();
          timexes_.set(index, builderForValue.build());
          onChanged();
        } else {
          timexesBuilder_.setMessage(index, builderForValue.build());
        }
        return this;
      }
      /**
       * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
       */
      public Builder addTimexes(edu.stanford.nlp.pipeline.CoreNLPProtos.Timex value) {
        if (timexesBuilder_ == null) {
          if (value == null) {
            throw new NullPointerException();
          }
          ensureTimexesIsMutable();
          timexes_.add(value);
          onChanged();
        } else {
          timexesBuilder_.addMessage(value);
        }
        return this;
      }
      /**
       * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
       */
      public Builder addTimexes(
          int index, edu.stanford.nlp.pipeline.CoreNLPProtos.Timex value) {
        if (timexesBuilder_ == null) {
          if (value == null) {
            throw new NullPointerException();
          }
          ensureTimexesIsMutable();
          timexes_.add(index, value);
          onChanged();
        } else {
          timexesBuilder_.addMessage(index, value);
        }
        return this;
      }
      /**
       * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
       */
      public Builder addTimexes(
          edu.stanford.nlp.pipeline.CoreNLPProtos.Timex.Builder builderForValue) {
        if (timexesBuilder_ == null) {
          ensureTimexesIsMutable();
          timexes_.add(builderForValue.build());
          onChanged();
        } else {
          timexesBuilder_.addMessage(builderForValue.build());
        }
        return this;
      }
      /**
       * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
       */
      public Builder addTimexes(
          int index, edu.stanford.nlp.pipeline.CoreNLPProtos.Timex.Builder builderForValue) {
        if (timexesBuilder_ == null) {
          ensureTimexesIsMutable();
          timexes_.add(index, builderForValue.build());
          onChanged();
        } else {
          timexesBuilder_.addMessage(index, builderForValue.build());
        }
        return this;
      }
      /**
       * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
       */
      public Builder addAllTimexes(
          java.lang.Iterable<? extends edu.stanford.nlp.pipeline.CoreNLPProtos.Timex> values) {
        if (timexesBuilder_ == null) {
          ensureTimexesIsMutable();
          com.google.protobuf.AbstractMessageLite.Builder.addAll(
              values, timexes_);
          onChanged();
        } else {
          timexesBuilder_.addAllMessages(values);
        }
        return this;
      }
      /**
       * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
       */
      public Builder clearTimexes() {
        if (timexesBuilder_ == null) {
          timexes_ = java.util.Collections.emptyList();
          bitField0_ = (bitField0_ & ~0x00000001);
          onChanged();
        } else {
          timexesBuilder_.clear();
        }
        return this;
      }
      /**
       * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
       */
      public Builder removeTimexes(int index) {
        if (timexesBuilder_ == null) {
          ensureTimexesIsMutable();
          timexes_.remove(index);
          onChanged();
        } else {
          timexesBuilder_.remove(index);
        }
        return this;
      }
      /**
       * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
       */
      public edu.stanford.nlp.pipeline.CoreNLPProtos.Timex.Builder getTimexesBuilder(
          int index) {
        return getTimexesFieldBuilder().getBuilder(index);
      }
      /**
       * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
       */
      public edu.stanford.nlp.pipeline.CoreNLPProtos.TimexOrBuilder getTimexesOrBuilder(
          int index) {
        if (timexesBuilder_ == null) {
          return timexes_.get(index);  } else {
          return timexesBuilder_.getMessageOrBuilder(index);
        }
      }
      /**
       * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
       */
      public java.util.List<? extends edu.stanford.nlp.pipeline.CoreNLPProtos.TimexOrBuilder> 
           getTimexesOrBuilderList() {
        if (timexesBuilder_ != null) {
          return timexesBuilder_.getMessageOrBuilderList();
        } else {
          return java.util.Collections.unmodifiableList(timexes_);
        }
      }
      /**
       * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
       */
      public edu.stanford.nlp.pipeline.CoreNLPProtos.Timex.Builder addTimexesBuilder() {
        return getTimexesFieldBuilder().addBuilder(
            edu.stanford.nlp.pipeline.CoreNLPProtos.Timex.getDefaultInstance());
      }
      /**
       * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
       */
      public edu.stanford.nlp.pipeline.CoreNLPProtos.Timex.Builder addTimexesBuilder(
          int index) {
        return getTimexesFieldBuilder().addBuilder(
            index, edu.stanford.nlp.pipeline.CoreNLPProtos.Timex.getDefaultInstance());
      }
      /**
       * <code>repeated .edu.stanford.nlp.pipeline.Timex timexes = 1;</code>
       */
      public java.util.List<edu.stanford.nlp.pipeline.CoreNLPProtos.Timex.Builder> 
           getTimexesBuilderList() {
        return getTimexesFieldBuilder().getBuilderList();
      }
      private com.google.protobuf.RepeatedFieldBuilder<
          edu.stanford.nlp.pipeline.CoreNLPProtos.Timex, edu.stanford.nlp.pipeline.CoreNLPProtos.Timex.Builder, edu.stanford.nlp.pipeline.CoreNLPProtos.TimexOrBuilder> 
          getTimexesFieldBuilder() {
        if (timexesBuilder_ == null) {
          timexesBuilder_ = new com.google.protobuf.RepeatedFieldBuilder<
              edu.stanford.nlp.pipeline.CoreNLPProtos.Timex, edu.stanford.nlp.pipeline.CoreNLPProtos.Timex.Builder, edu.stanford.nlp.pipeline.CoreNLPProtos.TimexOrBuilder>(
                  timexes_,
                  ((bitField0_ & 0x00000001) == 0x00000001),
                  getParentForChildren(),
                  isClean());
          timexes_ = null;
        }
        return timexesBuilder_;
      }

      // @@protoc_insertion_point(builder_scope:ai.uphere.HCoreNLP.ListTimex)
    }

    static {
      defaultInstance = new ListTimex(true);
      defaultInstance.initFields();
    }

    // @@protoc_insertion_point(class_scope:ai.uphere.HCoreNLP.ListTimex)
  }

  private static final com.google.protobuf.Descriptors.Descriptor
    internal_static_ai_uphere_HCoreNLP_ListTimex_descriptor;
  private static
    com.google.protobuf.GeneratedMessage.FieldAccessorTable
      internal_static_ai_uphere_HCoreNLP_ListTimex_fieldAccessorTable;

  public static com.google.protobuf.Descriptors.FileDescriptor
      getDescriptor() {
    return descriptor;
  }
  private static com.google.protobuf.Descriptors.FileDescriptor
      descriptor;
  static {
    java.lang.String[] descriptorData = {
      "\n\016HCoreNLP.proto\022\022ai.uphere.HCoreNLP\032\rCo" +
      "reNLP.proto\">\n\tListTimex\0221\n\007timexes\030\001 \003(" +
      "\0132 .edu.stanford.nlp.pipeline.TimexB\017B\rH" +
      "CoreNLPProto"
    };
    com.google.protobuf.Descriptors.FileDescriptor.InternalDescriptorAssigner assigner =
        new com.google.protobuf.Descriptors.FileDescriptor.    InternalDescriptorAssigner() {
          public com.google.protobuf.ExtensionRegistry assignDescriptors(
              com.google.protobuf.Descriptors.FileDescriptor root) {
            descriptor = root;
            return null;
          }
        };
    com.google.protobuf.Descriptors.FileDescriptor
      .internalBuildGeneratedFileFrom(descriptorData,
        new com.google.protobuf.Descriptors.FileDescriptor[] {
          edu.stanford.nlp.pipeline.CoreNLPProtos.getDescriptor(),
        }, assigner);
    internal_static_ai_uphere_HCoreNLP_ListTimex_descriptor =
      getDescriptor().getMessageTypes().get(0);
    internal_static_ai_uphere_HCoreNLP_ListTimex_fieldAccessorTable = new
      com.google.protobuf.GeneratedMessage.FieldAccessorTable(
        internal_static_ai_uphere_HCoreNLP_ListTimex_descriptor,
        new java.lang.String[] { "Timexes", });
    edu.stanford.nlp.pipeline.CoreNLPProtos.getDescriptor();
  }

  // @@protoc_insertion_point(outer_class_scope)
}