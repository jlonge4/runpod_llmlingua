import runpod
from llmlingua import PromptCompressor
import torch

llm_lingua = PromptCompressor("models/phi2")
torch.set_default_device("cuda")


def handler(job):
    """Handler function that will be used to process jobs."""
    job_input = job["input"]

    context = job_input.get("context", [""])
    instruction = job_input.get("instruction", "")
    question = job_input.get("question", "")
    target_token = job_input.get("target_token", 1000)

    compressed_prompt = llm_lingua.compress_prompt(
        context=context,
        instruction=instruction,
        question=question,
        target_token=target_token,
        rank_method="longllmlingua",
    )
    return compressed_prompt


runpod.serverless.start({"handler": handler})
