struct TransformationMatrix {
    float32_t4x4 WVP;
};
ConstantBuffer<TransformationMatrix> gTransformationMatrix : register(b0);
struct VertexShadeOutput {
    float32_t4 position : SV_Position;
};

struct VertexShaderInput {
    float32_t4 position : POSITION0;
};

VertexShadeOutput main(VertexShaderInput input) {
    VertexShadeOutput output;
    output.position = mul(input.position, gTransformationMatrix.WVP);
    return output;
}