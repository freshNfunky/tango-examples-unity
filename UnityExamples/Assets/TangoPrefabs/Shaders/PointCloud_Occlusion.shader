﻿Shader "Tango/PointCloud (Occlusion)" {
Properties{
        point_size("Point Size", Float) = 30.0
}
    SubShader {
        Tags { "Queue" = "Background-1" }
        Pass {
            ColorMask 0
        
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
               float4 vertex : POSITION;
            };
       
            struct v2f
            {
               float4 vertex : SV_POSITION;
               float size : PSIZE;
            };

            float point_size;
           
            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
                o.size = point_size;
                return o;
            }
           
            fixed4 frag (v2f i) : SV_Target
            {
                return fixed4(1, 1, 1, 1);
            }
            ENDCG
        }
    }
}
