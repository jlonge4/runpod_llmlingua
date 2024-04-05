<div align="center">

<h1>LLMLingua Prompt Compression | RunPod</h1>

🚀 | A custom RunPod Serverless Endpoint template that employs LLMlingua x Microsoft Phi-2 for prompt compression in seconds.
</div>

## 📖 | Getting Started

1. Navigate to RunPod Serverless [RUNPOD](https://www.runpod.io/console/serverless)
2. Create an endpoint.
3. Enter jlonge4/runpod-llmlingua:v3 as your image.
4. Checkout the test notebook for an example of sending a request for compressing context.
5. Send your compressed query to your LLM!

6. Alternatively deploy using my template here [TEMPLATE](https://www.runpod.io/console/user/templates)

- `DOCKERHUB` | [DOCKERHUB](https://hub.docker.com/repositories/jlonge4)


## Example Input

```json
{
    "input": {
        "context": "[context]",
        "instruction": "You are a q/a bot who uses the provided context to answer a question",
        "question": "What's the purpose of the tutorial?",
        "target_tokens": 350,
    }
}
```

## 🚀 | Execution Result

- Wall time: 1.25 s
```json
{
    "compressed_prompt": "You are a question answering bot who uses the provided\n"
                         "context to answer a question\n"
                         "In this short will explore how Face be deployed in a\n"
                         "Docker Container and a service...\n"
                         "What's the purpose of the tutorial?",
    "compressed_tokens": 788,
    "origin_tokens": 2171,
    "ratio": "2.8x",
    "saving": "Saving $0.1 in GPT-4."
}
```

## 🔗 | Links

🐳 [Docker Container](https://hub.docker.com/layers/jlonge4/runpod-llmlingua/v3/images/sha256-ead98c5fbf86c858fb75d50b27ba3d4ed91d904dee5c675c9e48dc2550f0f6c2?context=repo)
