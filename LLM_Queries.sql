SELECT *
  FROM snowflake.account_usage.metering_daily_history
  WHERE SERVICE_TYPE='AI_SERVICES';


select current_region(); - AWS_US_EAST_1

CREATE TABLE REVIEWS(
REVIEW_CONTENT VARCHAR(20)
);

INSERT INTO REVIEWS VALUES ('i HATE THIS');
INSERT INTO REVIEWS VALUES ('this is amazing!!');


--COMPLETE : Given a prompt, generates a response (completion) using your choice of supported language model.
SELECT SNOWFLAKE.CORTEX.COMPLETE('snowflake-arctic', 'What are large language models?'); -- 100351 (P0000): Request failed for external function COMPLETE$V2 with remote service error: 400 '"unknown model \"snowflake-arctic\""

--EMBED_TEXT_768 (SNOWFLAKE.CORTEX)
SELECT SNOWFLAKE.CORTEX.EMBED_TEXT_768('snowflake-arctic-embed-m', 'hello world'); --Creates a vector embedding of 768 dimensions from English-language text.

--EMBED_TEXT_1024 (SNOWFLAKE.CORTEX)
SELECT SNOWFLAKE.CORTEX.EMBED_TEXT_1024('nv-embed-qa-4', 'hello world'); --Creates a vector embedding of 1024 dimensions from English-language text.
--Unknown user-defined function SNOWFLAKE.CORTEX.EMBED_TEXT_1024

--FINETUNE (SNOWFLAKE.CORTEX) : This function lets you create and manage large language models customized for your specific task.
SELECT SNOWFLAKE.CORTEX.FINETUNE(
  'CREATE',
  'my_tuned_model',
  'mistral-7b',
  'SELECT prompt, completion FROM train',
  'SELECT prompt, completion FROM validation'
);

SELECT SNOWFLAKE.CORTEX.FINETUNE(
  'DESCRIBE',
  'CortexFineTuningWorkflow_f45b452d-1672-44fa-8516-d4cf772b16db'
);

SELECT SNOWFLAKE.CORTEX.FINETUNE('SHOW');

SELECT SNOWFLAKE.CORTEX.FINETUNE(
  'CANCEL',
  'CortexFineTuningWorkflow_194bbea4-1208-42f3-88c6-cfb202086125'
);

--SENTIMENT (SNOWFLAKE.CORTEX) : Returns a sentiment score for the given English-language input text.
SELECT SNOWFLAKE.CORTEX.SENTIMENT(review_content), review_content FROM reviews LIMIT 10;

--SUMMARIZE (SNOWFLAKE.CORTEX) : Summarizes the given English-language input text.
SELECT SNOWFLAKE.CORTEX.SUMMARIZE(review_content) FROM reviews LIMIT 10;

--TRANSLATE (SNOWFLAKE.CORTEX) : Translates the given input text from one supported language to another.
SELECT SNOWFLAKE.CORTEX.TRANSLATE(review_content, 'en', 'de') FROM reviews LIMIT 10;

--COUNT_TOKENS (SNOWFLAKE.CORTEX) : Returns the number of tokens in a prompt for the large language model or the task-specific function specified in the argument. This function does not support fine-tuned models.
SELECT SNOWFLAKE.CORTEX.COUNT_TOKENS( 'snowflake-arctic', 'what is a large language model?' ); --8

SELECT SNOWFLAKE.CORTEX.COUNT_TOKENS('SUMMARIZE', review_content) FROM tb_voc.public.reviews LIMIT 10;

--TRY_COMPLETE (SNOWFLAKE.CORTEX) : Performs the same operation as the COMPLETE function but returns NULL instead of raising an error when the operation cannot be performed.
SELECT SNOWFLAKE.CORTEX.TRY_COMPLETE('snowflake-arctic', 'What are large language models?'); --100351 (P0000): Request failed for external function TRY_COMPLETE$V2 with remote service error: 400 '"unknown model \"snowflake-arctic\""


--EXTRACT_ANSWER (SNOWFLAKE.CORTEX) : Extracts an answer to a given question from a text document.
SELECT
    SNOWFLAKE.CORTEX.EXTRACT_ANSWER(
    $$
    Apple Vision Pro comprises approximately 300 components.[40] It has a curved laminated glass display on the front, an aluminum frame on its sides, a flexible cushion on the inside, and a removable, adjustable headband. The frame contains five sensors, six microphones, and 12 cameras. Users see two 3660x3200 pixel[4] 1.41-inch (3.6 cm) micro-OLED displays with a total of 23 megapixels usually running at 90 FPS through the lens but can automatically adjust to 96 or 100 FPS based on the content being shown. The eyes are tracked by a system of LEDs and infrared cameras, which form the basis of the device's iris scanner named Optic ID (used for authentication, like the iPhone's Face ID). Horizontally-mounted motors adjust lenses for individual eye positions to ensure clear and focused images that precisely track eye movements. Sensors such as accelerometers and gyroscopes track facial movements, minimizing discrepancies between the real world and the projected image.[40] Custom optical inserts are supported for users with prescription glasses, which will attach magnetically to the main lens and are developed in partnership with Zeiss. The device's bone conduction speaker is inside the headband and is placed directly over the user's ears. It can also virtualize surround sound.[41][13][40] Two cooling fans about 4 cm (1.6 in) in diameter are placed near the eye positions to help with heat dissipation due to high-speed processing of data. An active noise control function counters distracting noises, including the fan sounds.[40] During the ordering process, users must scan their face using an iPhone or iPad with Face ID for fitting purposes; this can be done via the Apple Store app or at an Apple Store retail location.[42][43]

The Vision Pro uses the Apple M2 system on a chip. It is accompanied by a co-processor known as Apple R1, which is used for real-time sensor input processing. The device can be purchased with three internal storage configurations: 256 GB, 512 GB, and 1 TB.[36] It can be powered by an external power supply, a USB-C port on a Mac, or a battery pack rated for two and a half hours of use.[44][12] The battery pack connects to the headset using an unremovable 12-pin locking variant of the Lightning connector.[45]

The user's face is scanned by the headset during setup to generate a persona—a realistic avatar used by OS features.[46] One such feature is "EyeSight", an outward-facing display which displays the eyes of the user's persona. Its eyes appear dimmed when in AR and obscured when in full immersion to indicate the user's environmental awareness. When someone else approaches or speaks, even if the user is fully immersed, EyeSight shows their persona's virtual eyes normally and makes the other person visible.[44][47]

A digital crown dial on the headset is used to control the amount of virtual background occupying the user's field of view, ranging from a mixed-reality view where apps and media appear to float in the user's real-world surroundings, to completely hiding the user's surroundings.[48][44]
    $$,

    
    'What is the storage configuration of the product?'
    );
